# Contributing

Thanks for your interest in contributing to `toyboxpkgs`

- [Contributing Etiquette](#contributing-etiquette)
- [Creating an Issue](#creating-an-issue)
  * [Creating a Good Code Reproduction](#creating-a-good-code-reproduction)
- [Creating a Pull Request](#creating-a-pull-request)
  * [Setup](#setup)
  * [Making Changes](#making-changes)
    + [Modifying The Source Code](#modifying-the-source-code)
    + [Preview Changes](#preview-changes)
  * [Submit Pull Request](#submit-pull-request)
- [Commit Message Guidelines](#commit-message-guidelines)
  * [Commit Message Format](#commit-message-format)
  * [Revert](#revert)
  * [Type](#type)
  * [Scope](#scope)
  * [Subject](#subject)
  * [Body](#body)
  * [Footer](#footer)
  * [Examples](#examples)
- [License](#license)


## Contributing Etiquette

Please see our [Contributor Code of Conduct](./CODE_OF_CONDUCT.md) for information on our rules of conduct.

<!-------------------------------------------------------------------->

## Creating an Issue

* It is required that you clearly describe the steps necessary to reproduce the issue you are running into. Although we would love to help our users as much as possible, diagnosing issues without clear reproduction steps is extremely time-consuming and simply not sustainable.

* The issue list of this repository is exclusively for bug reports and feature requests. Non-conforming issues will be closed immediately.

* Issues with no clear steps to reproduce will not be triaged. If an issue is labeled with "needs: reply" and receives no further replies from the author of the issue for more than 14 days, it will be closed.

* If you think you have found a bug, or have a new feature idea, please start by making sure it hasn't already been [reported](https://github.com/toyboxco/toyboxpkgs/issues). You can search through existing issues to see if there is a similar one reported. Include closed issues as it may have been closed with a solution.

* Next, [create a new issue](https://github.com/toyboxco/toyboxpkgs/issues/new/choose) that thoroughly explains the problem. Please fill out the populated issue form before submitting the issue.

<!-------------------------------------------------------------------->

## Creating a Good Code Reproduction

### What is a Code Reproduction?

A code reproduction is a small application that is built to demonstrate a particular issue. The code reproduction should contain the minimum amount of code needed to recreate the issue and should focus on a single issue.

### Why Should You Create a Reproduction?

A code reproduction of the issue you are experiencing helps us better isolate the cause of the problem. This is an important first step to getting any bug fixed! 

Without a reliable code reproduction, it is unlikely we will be able to resolve the issue, leading to it being closed. In other words, creating a code reproduction of the issue helps us help you.

### How to Create a Reproduction

> Be sure to include steps to reproduce the issue. These steps should be clear and easy to follow.

1. Fork this repository.
2. Clone your fork.
3. Add the minimum amount of code needed to recreate the issue you are experiencing. Do not include anything that is not required to reproduce the issue. This includes any 3rd party plugins you have installed.
4. Publish the application on GitHub and include a link to it when [creating an issue](#creating-an-issue).

### Benefits of Creating a Reproduction

* **Minimal surface area:** By removing code that is not needed in order to reproduce the issue, it makes it easier to identify the cause of the issue.
* **No secret code needed:** Creating a minimal reproduction of the issue prevents you from having to publish any proprietary code used in your project.
* **Get help fixing the issue:** If we can reliably reproduce an issue, there is a good chance we will be able to address it.

<!-------------------------------------------------------------------->

## Creating a Pull Request

* We appreciate you taking the time to contribute! Before submitting a pull request, we ask that you please [create an issue](#creating-an-issue) that explains the bug or feature request and let us know that you plan on creating a pull request for it. If an issue already exists, please comment on that issue letting us know you would like to submit a pull request for it. This helps us to keep track of the pull request and make sure there isn't duplicated effort.

* Looking for an issue to fix? Make sure to look through our issues with the [help wanted](https://github.com/toyboxco/toyboxpkgs/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22) label!


### Setup

1. [Install toyboxpkgs](https://github.com/toyboxco/toyboxpkgs/blob/master/docs/development/installation.md) for latest stable version of the **toyboxpkgs CLI tool**.
2. Fork this repository.
3. Clone your fork.
4. Create a new branch from master for your change.
5. Follow the steps below for modifying the project.


### Making Changes

1. [Make your changes to the source code](#modifying-the-source-code). If the change is overly complex or out of the ordinary, add comments so we can understand the changes.
2. [Preview your changes](#preview-changes) locally.
3. After you have previewed and tested your changes, commit the changes. Please follow the [commit message format](#commit-message-format) for every commit.
4. [Submit a Pull Request](#submit-pull-request) of your changes.

#### Modifying The Source Code

To add a new package:

1. Execute the `make create-package name=<package name> ` command to scaffold a new package. This command does a few things:
    - Creates a directory under the `pkgs` directory with the provided `<package name>`.
    - Creates a `versions` directory with a stub `0.0.0.nix` file to use for pinning a particular version number.
    - Creates a `default.nix` file  to use for your base derivation.

2. Create a pinned version via the generated `0.0.0.nix` file. Change the name of the file after you've created you version pin to correspond with the given version number.

3. Add to the `default.nix` derivation to consume your pinned versions. Take a look at some of the existing packages for common practices.

> Feel free to add any tertiary files / directories for your derivations (patches, scripts, etc.).

2. Add the package entry to the `packages.nix` file in the root folder using the `<package name>` used in the first step. Make sure that the version number you reference matches an active derivation the corresponding `versions` directory for the package.

```nix
  foo-bar = foo-bar_1_0_0;
  foo-bar_1_0_0 = package "foo-bar" "1.0.0" {};
```

> If you want to add multiple pinned versions, add entries below the highest level pinned version.

```nix
  foo-bar = foo-bar_1_0_1;
  foo-bar_1_0_1 = package "foo-bar" "1.0.1" {};
  >>> foo-bar_1_0_0 = package "foo-bar" "1.0.0" {};
```

#### Preview Changes

To test newly added executables, you can run the following command in the project's root directory:

> This command reads the contents of the `buildInputs` array in the `shell.nix` file, so make sure you've accurately defined any new additions as outlined in the [Modifying The Source Code](#modifying-the-source-code) section.

```shell
nix-shell --pure --run "<name of the binary> <command>"
```

### Submit Pull Request

1. [Create a new pull request](https://github.com/toyboxco/toyboxpkgs/compare) with the `develop` branch as the `base`. You may need to click on `compare across forks` to find your changes.
2. See the [Creating a pull request from a fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) GitHub help article for more information.
3. Please fill out the provided Pull Request template to the best of your ability and include any issues that are related.

<!-------------------------------------------------------------------->

## Commit Message Guidelines

We have very precise rules over how our git commit messages should be formatted. This leads to readable messages that are easy to follow when looking through the project history. We also use the git commit messages to generate our [changelog](./CHANGELOG.md). Our format closely resembles Angular's [commit message guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit).

### Commit Message Format

We follow the [Conventional Commits specification](https://www.conventionalcommits.org/). A commit message consists of a **header**, **body** and **footer**.  The header has a **type**, **scope** and **subject**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory and the **scope** of the header is optional.

### Revert

If the commit reverts a previous commit, it should begin with `revert: `, followed by the header of the reverted commit. In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.

### Type

If the prefix is `feat`, `fix` or `perf`, it will appear in the changelog. However if there is any [BREAKING CHANGE](#footer), the commit will always appear in the changelog.

Must be one of the following:

* **feat**: A new feature
* **fix**: A bug fix
* **docs**: Documentation only changes
* **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **perf**: A code change that improves performance
* **test**: Adding missing tests
* **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation

### Scope

A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g.
```
feat(parser): add ability to parse arrays
```

### Subject

The subject contains succinct description of the change:

* use the imperative, present tense: "change" not "changed" nor "changes"
* do not capitalize first letter
* do not place a period `.` at the end
* entire length of the commit message must not go over 50 characters
* describe what the commit does, not what issue it relates to or fixes
* **be brief, yet descriptive** - we should have a good understanding of what the commit does by reading the subject

### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes".
The body should include the motivation for the change and contrast this with previous behavior.

### Footer

The footer should contain any information about **Breaking Changes** and is also the place to
reference GitHub issues that this commit **Closes**.

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines. The rest of the commit message is then used for this.

### Examples

Does not appear in the generated changelog:

```
docs(contributing): update pull request setup steps
```

Appears under "Features" header, `makefile` subheader:

```
feat(makefile): add `init` script
```

Appears under "Bug Fixes" header, with a link to issue #28:

```
fix: use proper color when animated

closes #28
```

Appears under "Refactor" header, and under "Breaking Changes" with the breaking change explanation:


```
refactor: update to toyboxpkgs 1.0.0 spec

BREAKING CHANGE: Updating template spec from 0.0.0 -> 1.0.0
```

Appears under "Breaking Changes" with the breaking change explanation:

```
refactor: update to toyboxpkgs 1.0.0 spec

BREAKING CHANGE:

Updating template spec from 0.0.0 -> 1.0.0
```

The following commit and commit `667ecc1` do not appear in the changelog if they are under the same release. If not, the revert commit appears under the "Reverts" header.

```
revert: feat(makefile): add `init` script

This reverts commit 667 ecc1654a317a13331b17617d973392f415f02.
```

## License

By submitting code as an individual you agree to the
[individual contributor license agreement](./docs/legal/individual_contributor_license_agreement.md).
By submitting code as an entity you agree to the
[corporate contributor license agreement](./docs/legal/corporate_contributor_license_agreement.md).

All Documentation content that resides under the [docs directory](/docs) of this
repository is licensed under Creative Commons:
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

<!-------------------------------------------------------------------->