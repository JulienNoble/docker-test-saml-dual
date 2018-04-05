## 2018-04-05 v1.15.4-1

* BREAKING : no more entity ID config, the container now spawns an SP
  (port 8443) and an IdP (port 8444) configured to run together.
* BREAKING : port 8080 is gone, no more http, only https.
* Updated SimpleSAMLphp to version 1.15.4.
* Refactored Dockerfile.
* Refactored `CHANGELOG.md`, `CONTRIBUTORS.md`, `CONTRIBUTING.md` and
  `README.md`.

## 2018-02-04 v1.15.2-1

* Changed PHP version to 7.1 instead of 7.x because of compatibility issues.
* BREAKING: \#8 Changed exposed ports from 80 and 443 to 8080 and 8443 to make
  it possible to run the container in environments where lower ports are not
  allowed.
* Refactored `CHANGELOG.md`, `CONTRIBUTORS.md`. Added `CONTRIBUTING.md`.
* Updated SimpleSAMLphp to version 1.15.2.
* Updated docker compose to version 3.
* Refactored Dockerfile.
* Switched to branches without bugfix version.
* Fixed contribution links in README.md.

## 2017-08-17 v1.14.15-1

* Introduced version branches and added note to README.md.
* Added Vim to the container for debugging.
* Updated SimpleSAMLphp to version 1.14.15.

## 2017-08-14 v1.14.8-2

* Switched downloads to CURL instead of Docker ADD since it now extracts
  downloaded archives.
* Fixed wrong path in example.
* Added changelog.
* Added contributor list.

## 2017-02-07 v1.14.8-1

* First release with SimpleSAMLphp 1.14.8.
