{
  linux-morello,
  makeLinuxHeaders
}:
makeLinuxHeaders {
  version = linux-morello.kernel.version;
  src = linux-morello.kernel.version;
}

