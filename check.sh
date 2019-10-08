#!/usr/bin/env bash

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
  echo " ---------------------------------------"
  echo "  URL: $1"
  echo " ---------------------------------------"
  lighthouse "$1" --chrome-flags="--headless --no-sandbox --window-size=1280,720" \
                  --config-path="/usr/src/app/config.json" \
                  --no-enable-error-reporting \
                  --output=json \
                  --output-path="/reports/${NAME}.json" || true
  shift
done
