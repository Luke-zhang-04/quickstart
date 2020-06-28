# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- feat(typescript): allow for standalone typescript installation
- feat: add npm `init -y` command when starting project
- CI: add standalone typescript testing
- feat(bash): add help option, callable with `-h` or `--help`

### Changed
- CI: change `react-ts-bs-eslint-stylelint-codeclimate` to `all-optons`

### Fixed
-  fix(make): check for stylelint with `$4` instead of `$3`

## [1.1.0] - 2020/06/14
### Added
- feat(bash): add version checking
    - now checks for version of Quickstart and notifies if out of date through
    - happens by reading data from version.txt from the quickstart gist

## [1.0.0] - 2020/06/07
### Added
- feat(bash): add eslint without react for ts and js

### Changed
- rename bash.bash to quickstart.bash
- docs(README): update readme with updated file names and resources header

## [0.1.0-b] -2020/06/07
### Added
- feat(react): add react app and react app with typescript
- feat(bash): add bootstrap option
- feat(bash): add quickstart ascii art
- feat(bash): add colours to log
- feat(bash): check for `.gitignore` before adding it
- add new logo
- feat(bash): add eslint configuration
- feat(bash/eslint): add more logs
- feat(bash): add codeclimate feature
- feat(bash): add stylelint option
- feat(bash): add seperate make command for makefile generation
- feat(bash): add independent eslint installation if no react app found
- feat(bash): add more sophisticated parameter checking

### Changed
- refactor (bash): refactor(bash): move functions to seperate files as modules
- refactor(bash): add colours.sh for colour valiables
- update tests with artifact uploading eca54eb 

### Fix
- fix(bash): fix bug where entire directory is deleted
