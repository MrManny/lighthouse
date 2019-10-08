# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
It does *not* use Semantic Versioning. Instead, "version numbers" here are based on
release dates following the ISO-like YYYY.MM.DD format.

## [Unreleased]

## [2019.10.08]
### Added
- Adding informative `cdn/cdn-status` audit that looks for the first "main" response. Currently,
  that is the first network response with a HTTP status code in the 2xx range. If anything is found
  that looks like a potential CDN hit/miss indicator, it will be extracted. Currently, the regular
  expression tasked to filter through response headers is looking for:
  `^(x|cf)(-varnish)?-cache(-status)?$`.
  In addition, it will also look for hints about the edge location that was serving the data, using
  the regular expression `^(x-served-by|x-amz-cf-pop|cf-ray|x-msedge-ref)$`.

### Removed
- Several audits that only focus on best practices have been removed. This container is solely
  designed to benchmark site performance.

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
[2019.08.28]: https://github.com/MrManny/lighthouse/compare/2019.08.28...2019.10.08
[2019.08.28]: https://github.com/MrManny/lighthouse/compare/2019.08.26...2019.08.28
[2019.08.26]: https://github.com/MrManny/lighthouse/compare/2019.08.05...2019.08.26
[2019.08.05]: https://github.com/MrManny/lighthouse/compare/2019.08.01...2019.08.05
[2019.08.01]: https://github.com/MrManny/lighthouse/releases/tag/2019.08.01
