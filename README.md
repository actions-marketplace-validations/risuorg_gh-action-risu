# GitHub Citellus Action

This action runs Citellus with provided parameters via optional `build.sh` and pushes the generated content to Git Hub Pages site.

## Environment variables

- `GH_PAGES_BRANCH` (optional): override the default `gh-pages` deployment branch
- `SOSREPORT` (optional): override the default `.` folder for SOSREPORT source
- `CONFIGPATH` (optional): Set path for finding the `.citellus.conf` configuration file

## Setup

Create a `.github/workflow/citellus.yml` like:

```yml
name: Run Citellus analysis

on:
  push:
    branches:
      - master
  schedule:
    - cron: "0 0 * * *"

jobs:
  citellus:
    runs-on: ubuntu-16.04
    steps:
      - uses: actions/checkout@v2

      # Use GitHub Actions' cache to shorten build times and decrease load on servers
      - uses: actions/cache@v2.1.0
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements/*') }}
          restore-keys: |
            ${{ runner.os }}-pip-

      - uses: citellusorg/gh-action-citellus@0.0.1
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
          SOSREPORT: test
          CONFIGPATH: "./"
```

Adjust your `build.sh` for additional commands:

```sh
#!/bin/bash
mkdir -p output
touch output/citellus.html
ln -s citellus.html output/index.html
```

Commit and let the GitHub Actions take care of it!
