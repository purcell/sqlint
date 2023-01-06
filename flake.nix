{
  description = "sqlint tool";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        env = pkgs.bundlerEnv {
          name = "sqlint";
          gemdir = ./.;
          groups = ["default" "development" "test"];

          meta = with pkgs.lib;
            {
              description = "sqlint";
              platforms = platforms.unix;
            };
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.ruby pkgs.bundler env pkgs.bundix ];
        };
      }
    );
}
