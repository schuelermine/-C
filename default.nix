{ lib, rustPlatform }:
rustPlatform.buildRustPackage {
  pname = "-C";
  version = "0.1.0";
  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
  meta = {
    homepage = "https://github.com/schuelermine/-C";
    license = lib.licenses.mit;
  };
}
