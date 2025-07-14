{
  description = "sqlint tool";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
    in
    {
      devShell = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          env = pkgs.bundlerEnv {
            name = "sqlint";
            gemdir = ./.;
            groups = [
              "default"
              "development"
              "test"
            ];

            meta = with pkgs.lib; {
              description = "sqlint";
              platforms = platforms.unix;
            };
          };
        in
        pkgs.mkShell {
          buildInputs = [
            env
            pkgs.bundix
          ];
        }
      );
    };
}
