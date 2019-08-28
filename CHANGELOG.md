# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
It does *not* use Semantic Versioning. Instead, "version numbers" here are based on
release dates following the ISO-like YYYY.MM.DD format.

## [Unreleased]

## [2019.08.28]
### Changed
- The console output (stdout) has been altered slightly to report which URL is being measured.

## [2019.08.26]
### Changed
- In the `check.sh` helper script, all throttling-related CLI options are now set to 0,
  hopefully disabling them altogether.
- The maximum amount of time to wait for a page to load has been reduced to 30 seconds.
- Chrome's window size is explicitly set to 1280x720. 

## [2019.08.05]
### Fixed
- Previously, it was possible that when measuring multiple sites, the results of subsequent
  measurements could have overwritten previous files.

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
[2019.08.28]: https://github.com/MrManny/lighthouse/compare/2019.08.26...2019.08.28
[2019.08.26]: https://github.com/MrManny/lighthouse/compare/2019.08.05...2019.08.26
[2019.08.05]: https://github.com/MrManny/lighthouse/compare/2019.08.01...2019.08.05
[2019.08.01]: https://github.com/MrManny/lighthouse/releases/tag/2019.08.01
