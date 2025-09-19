# GPUs

## GPU servers
- jamie (AMD EPYC)
    - H100 (80GB, CC support)
- eliza (Ampare aarch64)
    - A40 (48GB)

## Quick test
```
nvidia-smi
docker run --rm -it --device=nvidia.com/gpu=all ubuntu:latest nvidia-smi
```

## Cuda docker
- Check supported cuda version (it depends on the driver version)
```
nvidia-smi # this shows driver and cuda version
```

- Run containers
```
docker pull nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04
docker run -it --name dev-cuda12.8 -v /scratch/$USER/work:/work -device=nvidia.com/gpu=all nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04
```

- Test (in the container)
```
cd /work/
apt update
apt install git cmake
git clone https://github.com/NVIDIA/cuda-samples
cd cuda-samples
git checkout -b v12.8 tags/v12.8
mkdir build
cd build
cmake ..
make -j$(nproc)
./Samples/1_Utilities/deviceQuery/deviceQuery
```

- llama.cpp
```
git clone https://github.com/ggml-org/llama.cpp/
cd llama.cpp
apt install curl libcurl4-openssl-dev
cmake -B build -DGGML_CUDA=ON
cmake --build build --config Release -j $(nproc)
LLAMA_CACHE=/work/models ./build/bin/llama-cli -hf ggml-org/gemma-3-1b-it-GGUF --gpu-layers -1
```
