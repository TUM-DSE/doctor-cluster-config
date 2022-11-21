{...}: {
  flake.templates = {
    project-template = {
      path = ./project-template;
      description = "A basic make project with gcc";
    };
  };
}
