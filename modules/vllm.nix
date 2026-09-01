{
  # Serve Qwen3.8-27B via vLLM's OpenAI-compatible API.
  # Runs as a Docker container because nixpkgs has no maintained CUDA-enabled
  # vLLM package. FP8 checkpoint (~28GiB) is used to fit the 48GB A40
  # (weight-only FP8-Marlin kernels on Ampere). Only 16 of 64 layers keep a
  # KV cache (hybrid attention), so with fp8 KV the full 262144 context fits.
  # Flags follow https://recipes.vllm.ai/Qwen/Qwen3.8-27B
  virtualisation.oci-containers = {
    backend = "docker";
    containers.vllm = {
      image = "vllm/vllm-openai:v0.28.0-cu129-ubuntu2404";
      cmd = [
        "--model"
        "Qwen/Qwen3.8-27B-FP8"
        "--served-model-name"
        "qwen3.8-27b"
        # Text-only serving; skips loading the vision tower to leave VRAM for KV.
        "--language-model-only"
        "--host"
        "::"
        "--port"
        "8000"
        "--max-model-len"
        "262144"
        "--kv-cache-dtype"
        "fp8"
        "--gpu-memory-utilization"
        "0.94"
        "--reasoning-parser"
        "qwen3"
        # Required for OpenAI-style tool/function calling (e.g. coding agents)
        "--enable-auto-tool-choice"
        "--tool-call-parser"
        "qwen3_coder"
        # Built-in MTP draft head; dense 27B decode is bandwidth-bound on the A40.
        "--speculative-config"
        ''{"method":"mtp","num_speculative_tokens":3}''
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
