{
  # Serve Qwen3-30B-A3B-Instruct-2507 via vLLM's OpenAI-compatible API.
  # Runs as a Docker container because nixpkgs has no maintained CUDA-enabled
  # vLLM package. FP8 checkpoint is used to fit the 48GB A40 (weight-only
  # FP8-Marlin kernels on Ampere).
  virtualisation.oci-containers = {
    backend = "docker";
    containers.vllm = {
      image = "vllm/vllm-openai:v0.26.0-cu129-ubuntu2404";
      cmd = [
        "--model"
        "Qwen/Qwen3-30B-A3B-Instruct-2507-FP8"
        "--served-model-name"
        "qwen3-30b-a3b-instruct"
        "--host"
        "::"
        "--port"
        "8000"
        "--max-model-len"
        "98304"
        "--gpu-memory-utilization"
        "0.94"
        # Required for OpenAI-style tool/function calling (e.g. coding agents)
        "--enable-auto-tool-choice"
        "--tool-call-parser"
        "hermes"
      ];
      volumes = [ "/var/lib/vllm/huggingface:/root/.cache/huggingface" ];
      extraOptions = [
        "--device=nvidia.com/gpu=all"
        "--ipc=host"
        # Host networking so the API is reachable over IPv6 (retiolum) as well;
        # docker port publishing without userland-proxy is IPv4-only.
        "--network=host"
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 8000 ];

  systemd.tmpfiles.rules = [ "d /var/lib/vllm/huggingface 0755 root root -" ];
}
