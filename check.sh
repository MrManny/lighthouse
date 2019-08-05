#!/bin/bash
usage() {
  echo "Usage:    check.sh  <URL> [<URL>...]"
  echo ""
  echo "This script begins a Lighthouse-based performance auditing of the given URLs and stores JSON reports."
  echo ""
  echo "Example:  check.sh https://www.ait.ac.at/ https://www.google.com/"
}

if [[ $# -lt 1 ]]
then
  echo "Missing URL(s) as argument"
  usage
  exit 1
fi

while [[ "$1" ]]; do
  NAME=$(date -Iseconds)
  lighthouse "$1" --chrome-flags="--headless --no-sandbox" \
                  --no-enable-error-reporting \
                  --output=json \
                  --emulated-form-factor=none \
                  --throttling-method=provided \
                  --throttling.rttMs=0 \
                  --throttling.throughputKbps=0 \
                  --throttling.requestLatencyMs=0 \
                  --throttling.downloadThroughputKbps=0 \
                  --throttling.uploadThroughputKbps=0 \
                  --throttling.cpuSlowdownMultiplier=0 \
                  --only-categories=performance \
                  --output-path="/reports/${NAME}.json"
  shift
done
