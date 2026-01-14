{
  linux-morello,
  makeLinuxHeaders
}:
makeLinuxHeaders {
  version = linux-morello.version;
  src = linux-morello.src;
}

