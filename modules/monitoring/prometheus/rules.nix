{ lib, ... }: {
  srvos.prometheus = {
    ruleGroups.srvosAlerts.alertRules =
      (lib.genAttrs [
        "borgbackup-job-nfs-home.service"
        "borgbackup-job-nfs-share.service"
      ]
        (name: {
          expr = ''absent_over_time(task_last_run{name="${name}"}[1d])'';
          annotations.description = "status of ${name} is unknown: no data for a day";
        })) //
      (lib.genAttrs [
        "syncoid-home"
        "syncoid-share"
      ]
        (name: {
          expr = ''absent_over_time(task_last_run{name="${name}"}[10m])'';
          annotations.description = "status of ${name} is unknown: no data for 10 minutes";
        })) //
      {
        PublicRunnerActionOnline = {
          expr = ''count(http_busy{name=~"runner.*", status="online"}) < 2'';
          annotations.description = "{{$labels.instance}}: There are no public github action runner registerd with github (see https://github.com/organizations/ls1-sys-prog-course/settings/actions)";
        };

        InternalRunnerActionOnline = {
          expr = ''count(http_busy{name=~"internal-runner.*", status="online"}) < 1'';
          annotations.description = "{{$labels.instance}}: There are no interal github action runner registerd with github (see https://github.com/organizations/ls1-sys-prog-course-internal/settings/actions)";
        };

        # we don't have this course this semester
        #CloudlabGithubActionRunner = {
        #  expr = ''count(kubernetes_pod_container_state_code{pod_name=~"cloudlab-runner-deployment.*", state="running",container_name="runner"}) == 0'';
        #  annotations.description = "{{$labels.instance}}: There are no github action runner {{$value}} for (https://github.com/organizations/ls1-sys-prog-course/settings/actions)";
        #};

        #CloudlabGithubActionRunnerPresent = {
        #  expr = ''absent_over_time(kubernetes_pod_container_state_code{pod_name=~"cloudlab-runner-deployment.*", state="running",container_name="runner"}[10m])'';
        #  annotations.description = "status of public github action runner is unknown: no data for 10 minutes";
        #};

        InternalGithubActionRunner = {
          expr = ''count(kubernetes_pod_container_state_code{pod_name=~"internal-runner-deployment.*", state="running",container_name="runner"}) == 0'';
          annotations.description = "{{$labels.instance}}: There are no github action runner {{$value}} for (https://github.com/organizations/ls1-sys-prog-course-internal/settings/actions)";
        };

        InternalGithubActionRunnerPresent = {
          expr = ''absent_over_time(kubernetes_pod_container_state_code{pod_name=~"internal-runner-deployment.*", state="running",container_name="runner"}[10m])'';
          annotations.description = "status of internal github action runner is unknown: no data for 10 minutes";
        };
      };
  };
}
