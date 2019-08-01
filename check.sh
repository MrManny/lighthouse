#!/bin/bash
usage() {
  echo "Usage:  check.sh  <URL>"
  echo ""
  echo "This script begins a Lighthouse-based performance auditing of the given URL and stores them as JSON."
}

if [ $# -lt 1 ]
then
  echo "Missing URL as argument"
  usage
  exit 1
fi

NAME=$(date -Iseconds)

lighthouse $1 --chrome-flags="--headless --no-sandbox" --no-enable-error-reporting --output=json --emulated-form-factor=none --throttling-method=provided --only-categories=performance --output-path="/reports/${NAME}.json"

