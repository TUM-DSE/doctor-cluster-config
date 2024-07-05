{ config, lib, pkgs, kata-runtime, ... }: {
  qemu = lib.mkForce ''
    [hypervisor.qemu]
    path = "${kata-runtime}/bin/qemu-system-x86_64"
    kernel = "${kata-runtime}/share/kata-containers/vmlinux.container"
    image = "${kata-runtime}/share/kata-containers/kata-containers.img"
    machine_type = "q35"
    rootfs_type="ext4"
    enable_annotations = ["enable_iommu", "virtio_fs_extra_args", "kernel_params"]
    valid_hypervisor_paths = ["${kata-runtime}/bin/qemu-system-x86_64"]
    kernel_params = " "
    firmware = ""
    firmware_volume = ""
    machine_accelerators=""
    cpu_features="pmu=off"
    default_vcpus = 1
    default_maxvcpus = 0
    default_bridges = 1
    default_memory = 256
    default_maxmemory = 0
    disable_block_device_use = false
    shared_fs = "virtio-fs"
    virtio_fs_daemon = "${kata-runtime}/libexec/virtiofsd"
    valid_virtio_fs_daemon_paths = ["${kata-runtime}/libexec/virtiofsd"]
    virtio_fs_cache_size = 0
    virtio_fs_queue_size = 1024
    virtio_fs_extra_args = ["--thread-pool-size=1", "--announce-submounts"]
    virtio_fs_cache = "auto"
    block_device_driver = "virtio-scsi"
    block_device_aio = "io_uring"
    enable_iothreads = false
    enable_vhost_user_store = false
    vhost_user_store_path = "/var/run/kata-containers/vhost-user"
    valid_vhost_user_store_paths = ["/var/run/kata-containers/vhost-user"]
    vhost_user_reconnect_timeout_sec = 0
    valid_file_mem_backends = [""]
    pflashes = []
    valid_entropy_sources = ["/dev/urandom","/dev/random",""]
    disable_selinux=false
    disable_guest_selinux=true
    [factory]
    [agent.kata]
    kernel_modules=[]
    dial_timeout = 45
    [runtime]
    internetworking_model="tcfilter"
    disable_guest_seccomp=true
    sandbox_cgroup_only=false
    static_sandbox_resource_mgmt=false
    sandbox_bind_mounts=[]
    vfio_mode="guest-kernel"
    disable_guest_empty_dir=false
    experimental=[]
    create_container_timeout = 60
    privileged_without_host_devices=true
  '';

  fc = lib.mkForce ''
    [hypervisor.firecracker]
    path = "${kata-runtime}/bin/firecracker"
    kernel = "${kata-runtime}/share/kata-containers/vmlinux.container"
    image = "${kata-runtime}/share/kata-containers/kata-containers.img"
    rootfs_type="ext4"
    enable_annotations = ["enable_iommu", "virtio_fs_extra_args", "kernel_params"]
    valid_hypervisor_paths = ["${kata-runtime}/bin/firecracker"]
    jailer_path = "${kata-runtime}/bin/jailer"
    valid_jailer_paths = ["${kata-runtime}/bin/jailer"]
    kernel_params = " "
    default_vcpus = 1
    default_maxvcpus = 0
    default_bridges = 1
    default_memory = 256
    default_maxmemory = 0
    block_device_driver = "virtio-mmio"
    valid_entropy_sources = ["/dev/urandom","/dev/random",""]
    disable_selinux=false
    [factory]
    [agent.kata]
    kernel_modules=[]
    dial_timeout = 45
    [runtime]
    internetworking_model="tcfilter"
    disable_guest_seccomp=true
    sandbox_cgroup_only=false
    static_sandbox_resource_mgmt=true
    disable_guest_empty_dir=false
    experimental=[]
    create_container_timeout = 60
  '';

  fcd = lib.mkForce ''
    [hypervisor.firecracker]
    path = "${kata-runtime}/bin/firecracker"
    kernel = "${kata-runtime}/share/kata-containers/vmlinux.container"
    image = "${kata-runtime}/share/kata-containers/kata-containers.img"
    rootfs_type="ext4"
    enable_annotations = ["enable_iommu", "virtio_fs_extra_args", "kernel_params"]
    valid_hypervisor_paths = ["${kata-runtime}/bin/firecracker"]
    jailer_path = "${kata-runtime}/bin/jailer"
    valid_jailer_paths = ["${kata-runtime}/bin/jailer"]
    kernel_params = " "
    default_vcpus = 1
    default_maxvcpus = 0
    default_bridges = 1
    default_memory = 256
    default_maxmemory = 0
    block_device_driver = "virtio-mmio"
    valid_entropy_sources = ["/dev/urandom","/dev/random",""]
    disable_selinux=false
    [factory]
    [agent.kata]
    kernel_modules=[]
    dial_timeout = 45
    [runtime]
    internetworking_model="tcfilter"
    disable_guest_seccomp=true
    sandbox_cgroup_only=false
    static_sandbox_resource_mgmt=true
    disable_guest_empty_dir=false
    experimental=[]
    create_container_timeout = 60
  '';

  snp = lib.mkForce ''
    [hypervisor.qemu]
    path = "${kata-runtime}/bin/qemu-system-x86_64-snp-experimental"
    kernel = "${kata-runtime}/share/kata-containers/vmlinuz-confidential.container"
    initrd = "${kata-runtime}/share/kata-containers/kata-containers-initrd-confidential.img"
    machine_type = "q35"
    rootfs_type="ext4"
    confidential_guest = true
    sev_snp_guest = true
    enable_annotations = ["enable_iommu", "virtio_fs_extra_args", "kernel_params"]
    valid_hypervisor_paths = ["${kata-runtime}/bin/qemu-system-x86_64-snp-experimental"]
    kernel_params = " "
    firmware = "${kata-runtime}/share/ovmf/AMDSEV.fd"
    firmware_volume = ""
    machine_accelerators=""
    cpu_features="pmu=off"
    default_vcpus = 1
    default_maxvcpus = 0
    default_bridges = 1
    default_memory = 256
    default_maxmemory = 0
    disable_block_device_use = false
    shared_fs = "none"
    virtio_fs_daemon = "${kata-runtime}/libexec/virtiofsd"
    valid_virtio_fs_daemon_paths = ["${kata-runtime}/libexec/virtiofsd"]
    virtio_fs_cache_size = 0
    virtio_fs_queue_size = 1024
    virtio_fs_extra_args = ["--thread-pool-size=1", "--announce-submounts"]
    virtio_fs_cache = "auto"
    block_device_driver = "virtio-scsi"
    block_device_aio = "io_uring"
    enable_iothreads = false
    enable_vhost_user_store = false
    vhost_user_store_path = "/var/run/kata-containers/vhost-user"
    valid_vhost_user_store_paths = ["/var/run/kata-containers/vhost-user"]
    vhost_user_reconnect_timeout_sec = 0
    file_mem_backend = ""
    valid_file_mem_backends = [""]
    pflashes = []
    disable_image_nvdimm = true
    valid_entropy_sources = ["/dev/urandom","/dev/random",""]
    disable_selinux=false
    disable_guest_selinux=true
    [factory]
    [agent.kata]
    kernel_modules=[]
    dial_timeout = 90
    [runtime]
    internetworking_model="tcfilter"
    disable_guest_seccomp=true
    sandbox_cgroup_only=false
    static_sandbox_resource_mgmt=true
    sandbox_bind_mounts=[]
    vfio_mode="guest-kernel"
    disable_guest_empty_dir=false
    experimental=[]
    create_container_timeout = 60
  '';
}
