{...}: {
  flake.templates = {
    project = {
      path = ./project;
      description = "A basic make project with gcc";
    };
    home-manager = {
      path = ./home-manager;
      description = "A home-manager example";
    };
  };
}
