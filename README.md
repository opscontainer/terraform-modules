# Terraform Modules

Opensource collections of multi cloud terraform modules

# Terraform #

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)


This repository will provide you an opensource terraform modules and how we use it.

Overview 🌅
============

This project aims to demonstrate on how we use terraform on cloud infrastructure from account onboarding to provisioning.


Reference
===========
- [x] Module documentation can be found on each resource directory via `<cloud-provider>/<resource>/README.md` file.

![Terraform](assets/term.gif)

Naming Conventions
===================

- We usually refer to using the standard naming conventions from this source: [https://www.terraform-best-practices.com/naming](https://www.terraform-best-practices.com/naming)

- Never repeat resource type names like this `resource "aws_instance" "aws_ec2_instance" {` which makes our code ugly and confusing.

Tools
======
- [pre-commit](https://pre-commit.com/)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

To setup your local env, run the script from this repository via:

```bash
chmod +x scripts/setup-env.sh
./scripts/setup-env.sh
```

## Issuing a Report

To report an issue on our project:

  1. Check the repository's [issue tracker](https://github.com/opscontainer/terraform-modules/issues) on GitHub
  2. Check first, if the issue you are creating is already existing or not.
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

## Apache License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support this repository

Kindly support our GitHub repository, by following these steps:

  1. Visit my repository: Navigate to this [GitHub repository](https://github.com/opscontainer/terraform-modules)

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

**TODO**


## TODO's
- [ ] Automated Merge from CI
- [ ] Automated TF Lint
- [ ] Pre-commit config
