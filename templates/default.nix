{...}: {
  flake.templates = {
    trivial = {
      path = ./hello-cluster;
      description = "A very basic flake";
    };
  };
}
