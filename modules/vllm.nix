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
        "0.0.0.0"
        "--port"
        "8000"
        "--max-model-len"
        "32768"
        "--gpu-memory-utilization"
        "0.92"
      ];
      ports = [ "8000:8000" ];
      volumes = [ "/var/lib/vllm/huggingface:/root/.cache/huggingface" ];
      extraOptions = [
        "--device=nvidia.com/gpu=all"
        "--ipc=host"
      ];
    };
  };

  systemd.tmpfiles.rules = [ "d /var/lib/vllm/huggingface 0755 root root -" ];
}
