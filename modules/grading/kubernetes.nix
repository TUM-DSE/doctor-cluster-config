# Student sandboxes are orchestrated with kubernetes
{
  lib,
  stagingServer,
}:
let
  sandbox = "grading";
  object =
    apiVersion: kind: namespace: name: fields:
    {
      inherit apiVersion kind;
      metadata = {
        inherit name;
      }
      // lib.optionalAttrs (namespace != "") { inherit namespace; };
    }
    // fields;
  v1 = object "v1";
  policy =
    namespace: name: pods: fields:
    object "networking.k8s.io/v1" "NetworkPolicy" namespace name {
      spec = {
        podSelector = pods;
        policyTypes = [
          "Ingress"
          "Egress"
        ];
      }
      // fields;
    };
  storage = name: namespace: path: size: [
    (v1 "PersistentVolume" "" name {
      spec = {
        capacity.storage = size;
        accessModes = [ "ReadWriteMany" ];
        persistentVolumeReclaimPolicy = "Retain";
        storageClassName = "";
        nfs = {
          server = stagingServer;
          inherit path;
        };
        mountOptions = [
          "nfsvers=4.2"
          "hard"
          # The executor and controller exchange request/response files.
          "actimeo=0"
          "lookupcache=none"
        ];
        claimRef = { inherit namespace name; };
      };
    })
    (v1 "PersistentVolumeClaim" namespace name {
      spec = {
        accessModes = [ "ReadWriteMany" ];
        storageClassName = "";
        volumeName = name;
        resources.requests.storage = size;
      };
    })
  ];
  namespace =
    name:
    v1 "Namespace" "" name {
      metadata = {
        inherit name;
        labels = {
          "pod-security.kubernetes.io/enforce" = "restricted";
          "pod-security.kubernetes.io/enforce-version" = "v1.35";
          "pod-security.kubernetes.io/audit" = "restricted";
          "pod-security.kubernetes.io/warn" = "restricted";
        };
      };
    };
  admission =
    name: resources: validations:
    object "admissionregistration.k8s.io/v1" "ValidatingAdmissionPolicy" "" name {
      spec = {
        failurePolicy = "Fail";
        matchConstraints.resourceRules = [
          {
            apiGroups = if resources == [ "jobs" ] then [ "batch" ] else [ "" ];
            apiVersions = [ "v1" ];
            operations = [
              "CREATE"
              "UPDATE"
            ];
            inherit resources;
          }
        ];
        inherit validations;
      };
    };
  binding =
    name:
    object "admissionregistration.k8s.io/v1" "ValidatingAdmissionPolicyBinding" "" name {
      spec = {
        policyName = name;
        validationActions = [ "Deny" ];
        matchResources.namespaceSelector.matchLabels."kubernetes.io/metadata.name" = sandbox;
      };
    };
  validation = expression: message: { inherit expression message; };
  studentRules = prefix: metadata: [
    (validation "(!has(${prefix}.serviceAccountName) || ${prefix}.serviceAccountName == 'default') && ${prefix}.automountServiceAccountToken == false" "Sandboxes must use the tokenless default account")
    (validation "${prefix}.runtimeClassName == 'gvisor' && ${prefix}.restartPolicy == 'Never'" "Sandboxes require gVisor and no restarts")
    (validation "${metadata}.labels.app == 'grading-sandbox' && ${metadata}.labels['grading-lease'].matches('^[a-f0-9]{32}$')" "Sandboxes require a lease identity")
    (validation "${prefix}.securityContext.runAsUser in [10003, 10004] && ${prefix}.containers.all(c, !has(c.securityContext.runAsUser) || c.securityContext.runAsUser == ${prefix}.securityContext.runAsUser)" "Only student and grader identities are permitted")
    (validation "${prefix}.volumes.all(v, has(v.emptyDir) || (has(v.persistentVolumeClaim) && v.persistentVolumeClaim.claimName == 'grading-source-shared' && (v.persistentVolumeClaim.readOnly || ${prefix}.securityContext.runAsUser == 10004)))" "Only grader controllers may request writable staging volumes")
    (validation "${prefix}.containers.all(c, c.volumeMounts.all(m, ${prefix}.volumes.exists(v, v.name == m.name && (has(v.emptyDir) || (has(m.subPath) && m.subPath.startsWith('runs/' + ${metadata}.labels['grading-lease'] + '/') && !m.subPath.contains('..') && !has(m.subPathExpr) && ((has(m.readOnly) && m.readOnly) || (${prefix}.securityContext.runAsUser == 10004 && m.mountPath == '/control' && m.subPath == 'runs/' + ${metadata}.labels['grading-lease'] + '/control')))))))" "Staging mounts must belong to this lease; only its grader control directory may be writable")
    (validation "${prefix}.containers.all(c, c.securityContext.readOnlyRootFilesystem && c.image.matches('^.+@sha256:[a-f0-9]{64}$'))" "Sandboxes require read-only roots and digest-pinned images")
    (validation "!has(${prefix}.initContainers) && !has(${prefix}.ephemeralContainers) && !has(${prefix}.imagePullSecrets)" "Sandboxes cannot add auxiliary containers or image credentials")
    (validation "${prefix}.containers.all(c, !has(c.envFrom) && (!has(c.env) || c.env.all(e, !has(e.valueFrom))))" "Student containers cannot reference secrets through the environment")
    # The scheduler sets nodeName after admission. Preserve it on later updates so the Job controller can account for completion and remove finalizers.
    (validation (
      "!has(${prefix}.nodeName)"
      +
        lib.optionalString (prefix == "object.spec")
          " || (request.operation == 'UPDATE' && has(oldObject.spec.nodeName) && object.spec.nodeName == oldObject.spec.nodeName)"
    ) "Sandbox scheduling must use the grading RuntimeClass; updates must preserve the assigned node")
  ];
in
{
  foundation = [
    (namespace sandbox)
    (v1 "ServiceAccount" sandbox "default" { automountServiceAccountToken = false; })
    (v1 "ServiceAccount" sandbox "grading-executor" { automountServiceAccountToken = false; })
    (object "rbac.authorization.k8s.io/v1" "Role" sandbox "grading-executor" {
      rules = [
        {
          apiGroups = [ "batch" ];
          resources = [ "jobs" ];
          verbs = [
            "get"
            "list"
            "create"
            "delete"
            "deletecollection"
          ];
        }
        {
          apiGroups = [ "" ];
          resources = [ "pods" ];
          verbs = [
            "get"
            "list"
          ];
        }
        {
          apiGroups = [ "" ];
          resources = [ "pods/log" ];
          verbs = [ "get" ];
        }
      ];
    })
    (object "rbac.authorization.k8s.io/v1" "RoleBinding" sandbox "grading-executor" {
      subjects = [
        {
          kind = "ServiceAccount";
          name = "grading-executor";
          namespace = sandbox;
        }
      ];
      roleRef = {
        apiGroup = "rbac.authorization.k8s.io";
        kind = "Role";
        name = "grading-executor";
      };
    })
    (object "node.k8s.io/v1" "RuntimeClass" "" "gvisor" {
      handler = "runsc";
      scheduling.nodeSelector = {
        "grading.dos.cit.tum.de/enabled" = "true";
      };
    })
    # Validate both submitted Jobs and the Pods created by their controller.
    (admission "grading-sandbox-jobs" [ "jobs" ] (
      [
        (validation "object.spec.template.metadata.labels.app == 'grading-sandbox'" "Student Jobs must retain the sandbox network identity")
        (validation "has(object.spec.activeDeadlineSeconds) && object.spec.activeDeadlineSeconds > 0 && object.spec.activeDeadlineSeconds <= 86400 && object.spec.backoffLimit == 0" "Jobs require a bounded deadline and no retries")
      ]
      ++ studentRules "object.spec.template.spec" "object.spec.template.metadata"
    ))
    (binding "grading-sandbox-jobs")
    (admission "grading-sandbox-pods" [ "pods" ] (studentRules "object.spec" "object.metadata"))
    (binding "grading-sandbox-pods")
    (policy sandbox "default-deny" { } { })
    # External host executor credential; never mounted in student Pods.
    (v1 "Secret" sandbox "grading-executor-token" {
      metadata = {
        name = "grading-executor-token";
        namespace = sandbox;
        annotations."kubernetes.io/service-account.name" = "grading-executor";
      };
      type = "kubernetes.io/service-account-token";
    })
    (v1 "ResourceQuota" sandbox "grading-jobs" {
      spec.hard = {
        # Two student budgets plus the scripted grader controller.
        "requests.cpu" = "21";
        "limits.cpu" = "21";
        "requests.memory" = "65Gi";
        "limits.memory" = "65Gi";
        "requests.ephemeral-storage" = "129Gi";
        "limits.ephemeral-storage" = "129Gi";
        pods = "5";
        "count/jobs.batch" = "20";
        "count/secrets" = "1";
      };
    })
    (v1 "LimitRange" sandbox "grading-jobs" {
      spec.limits = [
        {
          type = "Container";
          max = {
            cpu = "10";
            memory = "32Gi";
            "ephemeral-storage" = "64Gi";
          };
        }
      ];
    })
  ]
  ++ storage "grading-source-shared" sandbox "/" "128Gi";
}
