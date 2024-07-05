{
  description = "Templates and workflows for my daily Nix needs";
  outputs = {self}: {
    templates = {
      default = {
        path = ./templates/base;
        description = "A base Flake for virtually all needs";
      };
    };
  };
}
