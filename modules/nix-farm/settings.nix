# Constants of the build farm (docs/nix-farm.md).
{
  # served by doctor, the only host the university firewall lets the outside reach
  domain = "farm.dos.cit.tum.de";
  # balancer and scheduler
  lbHost = "graham";
  lbName = "graham.dos.cit.tum.de";
  port = 50051;
  workerPort = 50052;
  audience = "nix-farm";
  # only the certificates, so that a node does not restart with every commit
  certs = "${./certs}";
  niks3Url = "https://niks3.dos.cit.tum.de";
  cacheUrl = "https://cache.dos.cit.tum.de";
  cacheKey = "cache.dos.cit.tum.de-1:ZCSRbf/HsV0XwrrfR4dC6HyrjqwqKXmR/hDPsYyZ9Sg=";
}
