# Lighthouse Performance Evaluation

This docker image aims at bundling Lighthouse and Chromium into an Ubuntu-based environment.
The result allows for quick and easy performance tests and audits based on these tools.

## What's in it

This image is directly based on `ubuntu:19.04`. In addition, it installs:
* curl
* [NodeJS](https://nodejs.org/)
* npm
* [Chromium](https://www.chromium.org/)
* [Lighthouse](https://developers.google.com/web/tools/lighthouse/)

It exposes a volume named `/reports` for data exchange between the host and the container.

The image also contains a small script named `check.sh`.
Using this simple script, you can quickly perform a performance-only test without throttling using
Lighthouse and a headless Chromium instance:

> Usage:  check.sh  <URL>
>
> This script begins a Lighthouse-based performance auditing of the given URL and stores them as JSON.

Any reports this script generates will be automatically put into `/reports`. The file name of
this report is the current date and time, formatted according to ISO 8601 with precision down to
the second.

Example:

```bash
check.sh https://hub.docker.com/  # this will run a performance audit and store the results in /reports
```

## Running it

By default, this image will launch into bash and do nothing else.
You would either have to attach to the container to run your Lighthouse tests manually, or
you can run a single test by directly starting the check.sh script with docker run.

### Shell

The container will start into bash. No tests will be run. This is the default behavior.
You should initiate Lighthouse audits manually, e.g., by being attached to the container.

Example:
```bash
# Host:
docker run -it --rm --network bridge -v /reports/go/here:/reports mrmanny/lighthouse

# Container:
check.sh https://hub.docker.com
``` 

### Run Lighthouse

You can perform a single test directly. The container will stop after it is done.
If you add `--rm` to the docker run command, the container will be removed after stopping. 

Example:
```bash
docker run -it --rm --network bridge -v /reports/go/here:/reports mrmanny/lighthouse check.sh https://hub.docker.com
```
