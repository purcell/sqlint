{
  description = "sqlint tool";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs =
    { self, nixpkgs }@inputs:
    {
      devShell = builtins.mapAttrs (
        system: pkgs:
        let
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
      ) nixpkgs.legacyPackages;
    };
}
