<h1 align="center" style="border-bottom: none;">🌙📦 lunarispkgs</h1>
<h3 align="center">A Nix package channel for Lunaris Studios development</h3>
<p align="center">
  <a href="#badge">
    <img alt="semantic-release" src="https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg">
  </a>
</p>

**lunarispkgs** is a derivative of the [Nixpkgs](https://github.com/nixos/nixpkgs) collection - a collection of software packages that can be installed with the [Nix](https://nixos.org/nix/) package manager. In order to streamline development and CI pipelines at Lunaris Studios, we've implemented our own custom package channel quick and iterative development via **Nix**.

## Packages

| Packages           | Versions                                                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------ |
| `bazel`            | <ul><li>3.2.0 (bazel_3_2_0)</li></ul>                                                                        |
| `go`               | <ul><li>1.14.2 (go_1_14_2)</li></ul>                                                                         |
| `golangci-lint`    | <ul><li>1.27.0 (golangci-lint_1_27_0)</li></ul>                                                              |
| `google-cloud-sdk` | <ul><li>268.0.0 (google-cloud-sdk_268_0_0)</li></ul>                                                         |
| `mirror`           | <ul><li> 1.0.2 (mirror_1_0_2)</li></ul>                                                                      |
| `nodejs`           | <ul><li>10.19.0 (nodejs_10_19_0)</li></ul>                                                                   |
| `openjdk`          | <ul><li>14.0.1 (openjdk_14)</li><li>11.0.6 (openjdk_11)</li><li>1.8.0_242 (openjdk_8)</li></ul>              |
| `python`           | <ul><li>3.7.7 (python_3_7_7)</li></ul>                                                                       |
| `skaffold`         | <ul><li>1.11.0 (skaffold_1_11_0)</li><li>1.10.1 (skaffold_1_10_1)</li><li>1.10.0 (skaffold_1_10_0)</li></ul> |

## Get Started

> Our home management system, [Casa](https://github.com/lunaris-studios/casa), is shipped with the highest level revisions for all `lunarispkgs` packages.

1. [Install Nix](#installing-nix)
2. Install **_lunarispkgs_** for your environment
   - [Nix Channels](#nix-channels)
   - [Niv](#niv)

## Installing Nix

```bash
$ curl -L https://nixos.org/nix/install | sh
```

# Installation

## Nix Channels

Subscribe to the **lunarispkgs** custom channel

```bash
nix-channel --add https://nixos.org/channels/nixpkgs-unstable lunarispkgs
```

Import the channel in your derivations

```nix
lunarispkgs = import <lunarispkgs> {};
```

## Niv

`niv` is available in [nixpkgs](https://github.com/NixOS/nixpkgs) on the master branch as `niv`. It is also available on the release-19.09 branch as `haskellPackages.niv`. Otherwise, run:

```bash
nix-env -iA niv -f https://github.com/nmattia/niv/tarball/master \
    --substituters https://niv.cachix.org \
    --trusted-public-keys niv.cachix.org-1:X32PCg2e/zAm3/uD1ScqW2z/K0LtDyNV7RdaxIuLgQM=
```

If you're using `home-manager`, you can add it to your `home.nix` profile via the [nixpkgs](https://github.com/NixOS/nixpkgs) channel.

```nix
home.packages = with pkgs; [
  niv
  ...
];
```

In your project directory, run `niv init` to bootstrap `niv`. Now you can install latest version of `lunarispkgs` by running the following:

```bash
niv add lunaris-studios/lunarispkgs
```

This will pull directly fromt the `master` branch. You can target a specific branch by applying the `-b <BRANCH>` flag:

```bash
niv add lunaris-studios/lunarispkgs -b alpha
```

You can add a specific version of the collection via:

```bash
niv add lunarispkgs \
  -v 1.1.0-alpha.1 \
  -t "https://github.com/lunaris-studios/lunarispkgs/archive/v<version>.tar.gz"
```