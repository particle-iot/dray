# Changelog
All notable changes to this project will be documented in this file.


0.14.1 - 2016-10-03
-------------------
### Fixed
- Remove job volumes after finishing

0.14.0 - 2016-09-21
-------------------
### Added
- Publishing PubSub message when executing a step

0.13.0 - 2016-08-01
-------------------
### Added
- Publishing PubSub message when updating a job
- Allow expiring Redis keys storing job info
- Allow removing job from index after being done

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
