# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
It does *not* use Semantic Versioning. Instead, "version numbers" here are based on
release dates following the ISO-like YYYY.MM.DD format.

## [Unreleased]
### Fixed
- Previously, it was possible that when measuring multiple sites, the results of subsequent
  measurements could have overwritten previous files.

## [2019.08.05]
### Changed
- Condensing commands in Dockerfile to reduce number of steps/layers.
- check.sh now accepts multiple URLs at once.

### Removed
- During build, after the last call to `apt` has been made, `/var/lib/apt/lists/*` will now be
  cleaned up properly.

## [2019.08.01]
Initial commit.
### Added
- Added Dockerfile based on Ubuntu 19.04
- Added little helper script `check.sh`
- Added README
- Added Changelog

[Unreleased]: https://github.com/MrManny/lighthouse/compare/master...develop
[2019.08.05]: https://github.com/MrManny/lighthouse/compare/2019.08.01...2019.08.05
[2019.08.01]: https://github.com/MrManny/lighthouse/releases/tag/2019.08.01
