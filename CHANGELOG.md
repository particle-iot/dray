# Changelog
All notable changes to this project will be documented in this file.

0.12.0 - 2016-06-24
-------------------
### Added
- Allowing to use Redis instances using authentication

### Fixed
- Concurrent jobs crashing if using the same file pipe

0.11.0 - 2016-06-22
-------------------
### Added
- Passing environment variables describing job and current step
- Storing job creation time and how long did it take
- Allowing to pass `stdIn` to the first step

0.10.0 - 2015-03-19
-------------------
### Added
- Support for refresh flag on job steps to automatically pull latest images

0.9.0 - 2015-03-09
-------------------
### Added
- Support for selectable output channels

0.1.1 - 2015-01-29
-------------------
### Added
- Configurable log levels
- Godeps for dependency management

### Fixed
- Concurrency bug when reading from stdout

Initial beta release
0.1.0 - 2015-01-29
-------------------
Initial beta release
