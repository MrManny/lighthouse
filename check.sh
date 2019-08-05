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
  lighthouse "$1" --chrome-flags="--headless --no-sandbox" --no-enable-error-reporting --output=json --emulated-form-factor=none --throttling-method=provided --only-categories=performance --output-path="/reports/${NAME}.json"
  shift
done
