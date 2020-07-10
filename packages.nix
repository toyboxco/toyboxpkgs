{ nixpkgs ? import ./nix {} }:
with nixpkgs;
let
  package = p: v: { ... } @args: callPackage (./. + "/src/pkgs/${p}/versions/${v}.nix") ( args // {});
in
rec {
  bazel = bazel_3_2_0;
  bazel_3_2_0 = package "bazel" "3.2.0" {
    buildJdk = openjdk_8;
    buildJdkName = "jdk8";
    runJdk = openjdk_11_headless;
    bazelSelf = bazel_3_2_0;
  };

  mirror = mirror_1_0_2;
  mirror_1_0_2 = package "mirror" "1.0.2" {};

  go = go_1_14_4;
  go_1_14_4 = nixpkgs.pkgs.go_1_14; 

  golangci-lint = golangci-lint_1_27_0;
  golangci-lint_1_27_0 = package "golangci-lint" "1.27.0" {};

  google-cloud-sdk = google-cloud-sdk_268_0_0;
  google-cloud-sdk-gce = google-cloud-sdk-gce_268_0_0;
  google-cloud-sdk_268_0_0 = package "google-cloud-sdk" "268.0.0" {};
  google-cloud-sdk-gce_268_0_0 = google-cloud-sdk.override { withGce = true; };

  helm = helm_3_2_1;
  helm_3_2_1 = package "helm" "3.2.1" {};

  jq = jq_1_6;
  jq_1_6 = package "jq" "1.6" {};

  k9s = k9s_0_19_4;
  k9s_0_19_4 = package "k9s" "0.19.4" {};

  openjdk = openjdk_14;
  openjdk_headless = openjdk_14_headless;
  openjdk_14 = nixpkgs.pkgs.openjdk14;
  openjdk_14_headless = nixpkgs.pkgs.openjdk14_headless;  
  openjdk_11 = nixpkgs.pkgs.openjdk11;
  openjdk_11_headless = nixpkgs.pkgs.openjdk11_headless;
  openjdk_8 = nixpkgs.pkgs.openjdk8;
  openjdk_8_headless = nixpkgs.pkgs.openjdk8_headless;

  nodejs = nodejs_10_19_0;
  nodejs_10_19_0 = package "nodejs" "10.19.0" {};

  python = python_3_7_7;
  python_3_7_7 = nixpkgs.pkgs.python37;

  skaffold = skaffold_1_11_0;
  skaffold_1_11_0 = package "skaffold" "1.11.0" {};
  skaffold_1_10_1 = package "skaffold" "1.10.1" {};
  skaffold_1_10_0 = package "skaffold" "1.10.0" {};
}