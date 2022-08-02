{...}: {
  flake.templates = {
    cluster-project = {
      path = ./cluster-project;
      description = "A basic make project with gcc";
    };
  };
}
