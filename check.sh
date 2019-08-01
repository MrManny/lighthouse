#!/bin/bash
if [ $# -lt 1 ]
then
  echo "Missing URL as argument"
  exit 1
fi

NAME=$(date -Iseconds)

lighthouse $1 --chrome-flags="--headless --no-sandbox" --no-enable-error-reporting --output=json --emulated-form-factor=none --throttling-method=provided --only-categories=performance --output-path="/reports/${NAME}.json"

