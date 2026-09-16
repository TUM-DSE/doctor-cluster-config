{
  # Serve Qwen3.8-27B via vLLM's OpenAI-compatible API.
  # Runs as a Docker container because nixpkgs has no maintained CUDA-enabled
  # vLLM package. FP8 checkpoint (~28GiB) is used to fit the 48GB A40
  # (weight-only FP8-Marlin kernels on Ampere). Only 16 of 64 layers keep a
  # KV cache (hybrid attention). With the vision tower loaded and encoder
  # cache reserved (~0.9GiB), fp8 KV still fits the full 262144 context.
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
        # Cap multimodal items per prompt so vLLM's encoder profiling run
        # reserves less VRAM; video is disabled entirely.
        "--limit-mm-per-prompt"
        ''{"image":4,"video":0}''
        "--mm-processor-cache-gb"
        "1"
        "--host"
        "::"
        "--port"
        "8000"
        "--max-model-len"
        "262144"
        "--kv-cache-dtype"
        "fp8"
        "--gpu-memory-utilization"
        # 0.94 yielded 231k KV tokens with vision; 0.96 covers the full context
        # (CUDA graph memory is profiled separately since v0.21).
        "0.96"
        "--reasoning-parser"
        "qwen3"
        # Required for OpenAI-style tool/function calling (e.g. coding agents)
        "--enable-auto-tool-choice"
        "--tool-call-parser"
        "qwen3_coder"
        # Always report token usage (incl. prefix-cache hits) to clients.
        "--enable-force-include-usage"
        "--enable-prompt-tokens-details"
        # Per-request log lines drown the journal; metrics cover this.
        "--disable-log-requests"
        "--disable-uvicorn-access-log"
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

  # vLLM exposes KV-cache usage, throughput and latency histograms on /metrics;
  # telegraf re-exports them on :9273 where prometheus already scrapes.
  services.telegraf.extraConfig.inputs.prometheus = [
    {
      urls = [ "http://localhost:8000/metrics" ];
      metric_version = 2;
      tags.app = "vllm";
    }
  ];

  systemd.tmpfiles.rules = [ "d /var/lib/vllm/huggingface 0755 root root -" ];
}
