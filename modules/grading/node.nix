{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.services.grading-worker;
  runner = import ./runner.nix { inherit pkgs inputs; };
  kubernetesArch =
    if pkgs.stdenv.hostPlatform.isx86_64 then
      "amd64"
    else if pkgs.stdenv.hostPlatform.isAarch64 then
      "arm64"
    else
      pkgs.stdenv.hostPlatform.linuxArch;
in
{
  options.services.grading-worker = {
    enable = lib.mkEnableOption "use of this k3s node to grade student submissions";
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = config.services.k3s.enable && config.services.k3s.role == "agent";
        message = "services.grading-worker must be enabled on a k3s agent";
      }
    ];

    services.k3s.nodeLabel = [
      "grading.dos.cit.tum.de/enabled=true"
      "grading.dos.cit.tum.de/arch=${kubernetesArch}"
    ];

    environment.systemPackages = [
      pkgs.gvisor
    ];
    environment.etc."grading/runner-image".source = "${runner}/reference";
    systemd.services.grading-runner = {
      description = "Load the Nix-built grading runner into containerd";
      wantedBy = [ "multi-user.target" ];
      requires = [ "containerd.service" ];
      after = [ "containerd.service" ];
      path = [ pkgs.containerd ];
      script = ''
        # The transfer API creates a digest name for the outer OCI index.
        # Local import registers the manifest digest used by the CLI and executor.
        ctr --address /run/containerd/containerd.sock --namespace k8s.io images import \
          --local --base-name grading.local/grading/runner --digests --no-unpack \
          ${runner}/image.tar
        ctr --address /run/containerd/containerd.sock --namespace k8s.io images label \
          "$(cat ${runner}/reference)" io.cri-containerd.pinned=pinned
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };
    services.k3s.extraFlags = [
      "--kubelet-arg=pod-max-pids=256"
      "--kubelet-arg=container-log-max-size=10Mi"
      "--kubelet-arg=container-log-max-files=3"
    ];
    # Kubernetes mounts the central staging export on the host, outside the sandbox.
    boot.supportedFilesystems = [ "nfs" ];
    systemd.services.k3s = {
      requires = [ "grading-runner.service" ];
      after = [ "grading-runner.service" ];
    };
    systemd.services.containerd.path = [ pkgs.gvisor ];
    virtualisation.containerd.settings.plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runsc = {
      runtime_type = "io.containerd.runsc.v1";
    };
  };
}
