# GitHub Citellus Action

This action runs Citellus with provided parameters via optional `build.sh` and pushes the generated content to Git Hub Pages site.

## Environment variables

- `GH_PAGES_BRANCH` (optional): override the default `gh-pages` deployment branch
- `SOSREPORT` (optional): override the default `.` folder for SOSREPORT source
- `CONFIGPATH` (optional): Set path for finding the `.citellus.conf` configuration file
