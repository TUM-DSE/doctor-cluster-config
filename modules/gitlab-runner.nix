{ config, ... }:
# GitLab CI runners for the compiler-hw-lab course on gitlab.lrz.de.
# Gitlab runner for https://gitlab.lrz.de/compiler-hw-lab/infra 
{
  # docker itself is enabled for all hosts in configurations.nix
  sops.secrets.gitlab-runner-compiler-hw-lab = { };
  sops.secrets.gitlab-runner-compiler-hw-lab-build = { };

  services.gitlab-runner = {
    enable = true;
    settings.concurrent = 6;
    services = {
      # Group runner on `compiler-hw-lab` (tag: compiler-hw-lab), runs student code.
      # Every job gets a fresh unprivileged container.
      compiler-hw-lab = {
        authenticationTokenConfigFile = config.sops.secrets.gitlab-runner-compiler-hw-lab.path;
        dockerImage = "debian:stable";
        dockerPullPolicy = "always";
        dockerAllowedImages = [ "gitlab.lrz.de:5005/compiler-hw-lab/infra:*" ];
        limit = 6;
        registrationFlags = [
          "--docker-cpus 6"
          "--docker-memory 32g"
          # add targeted privileges here if a task needs them, e.g.
          # "--docker-cap-add SYS_PTRACE" or "--docker-devices /dev/kvm"
        ];
      };
      # Project runner on `compiler-hw-lab/infra` only (tag: compiler-hw-lab-build).
      # Builds the grading image; has access to the host docker socket, so it
      # must never be attached to the group or to student projects.
      compiler-hw-lab-build = {
        authenticationTokenConfigFile = config.sops.secrets.gitlab-runner-compiler-hw-lab-build.path;
        dockerImage = "docker:cli";
        dockerVolumes = [ "/var/run/docker.sock:/var/run/docker.sock" ];
        limit = 1;
      };
    };
  };

  services.gitlab-runner.clear-docker-cache.enable = true;
}
