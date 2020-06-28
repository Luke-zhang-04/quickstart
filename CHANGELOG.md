# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
-   feat(typescript): allow for standalone typescript installation 6fc2a6a
-   feat: add npm `init -y` command when starting project 2458ae5
-   CI: add standalone typescript testing d4853f1
-   feat(bash): add help option, callable with `-h` or `--help` 316e2a5

### Changed
-   CI: change `react-ts-bs-eslint-stylelint-codeclimate` to `all-optons` c9647d0 

### Fixed
-  fix(make): check for stylelint with `$4` instead of `$3` bfdde0a 

## [1.1.0] - 2020/06/14
### Added
-   feat(bash): add version checking 5df0607
	-   now checks for version of Quickstart and notifies if out of date through
	-   happens by reading data from version.txt from the quickstart gist

## [1.0.0] - 2020/06/07
### Added
-   feat(bash): add eslint without react for ts and js df0622e 

### Changed
-   rename bash.bash to quickstart.bash 67f6ff6 
-   docs(README): update readme with updated file names and resources header 7bfa6dc 

## [0.1.0-b] - 2020/06/07
### Added
-   feat(react): add react app and react app with typescript 2087ccafab4e5c4e078054fa83ad24e39db94db2
-   feat(bash): add bootstrap option 86c94d98ae2bd97345029da33e66c934615e38db
-   feat(bash): add quickstart ascii art 08983df
-   feat(bash): add colours to log 3f02a5c
-   feat(bash): check for `.gitignore` before adding it 0a46ec2 
-   add new logo d679cf0
-   feat(bash): add eslint configuration ca7e641
-   feat(bash/eslint): add more logs db379d9 
-   feat(bash): add codeclimate feature bffeefe 
-   feat(bash): add stylelint option 0160f0f
-   feat(bash): add seperate make command for makefile generation b8622aa 
-   feat(bash): add independent eslint installation if no react app found 5dd58ca 
-   feat(bash): add more sophisticated parameter checking 3d9beb2 

### Changed
-   refactor (bash): refactor(bash): move functions to seperate files as modules a8d634a
-   refactor(bash): add colours.sh for colour valiables 4e1f014
-   update tests with artifact uploading eca54eb 

### Fix
-   fix(bash): fix bug where entire directory is deleted 8924d10d25fe003e420c9932471f2fbe51fb7403
