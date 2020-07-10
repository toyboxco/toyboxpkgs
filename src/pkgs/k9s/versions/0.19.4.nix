{ callPackage }:

let
  build = callPackage ../k9s.nix {};
in
  build {
    version = "0.19.4";
    sha256 = "1ya3lrw31pxd1rxzf88l5hzilaxwrng1a3ibawgn57my333hrmf6";
    vendorSha256 = "0vvzv5v7j77v809h2ial9n23244j1sy3xhkarsv0wwkifc3swvq5";
  }