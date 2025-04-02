{ 
  stdenv, 
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "nvidia-gpu-admin-tools";
  version = "2024.12.06";
  src = fetchFromGitHub {
    owner = "nvidia";
    repo = "gpu-admin-tools";
    tag = "v${version}";
    sha256 = "sha256-xAX+c1e8UBD15eKw5OQeEXlIQSRVNqe64yHHOqEZUDA=";
  };

  # The source is a collection of python files, not a package. 
  # Therefore we just provide them in a folder
  installPhase = ''
    mkdir -p $out/share/nvidia-gpu-admin-tools
    cp -r cli gpu pci util nvidia_gpu_tools.py $out/share/nvidia-gpu-admin-tools
  '';
}
