#!/bin/bash
shopt -s nullglob
files=(/tmp/passenger-error-*.html)
if [ ${#files[@]} -eq 0 ]; then
  echo NO_PASSENGER_ERROR
  exit 0
fi
LATEST=$(ls -1t /tmp/passenger-error-*.html | head -n1)
echo "FILE: $LATEST"
echo "--- ERROR LINES ---"
grep -n -E 'Error|syntax error|Could not find|Could not spawn|timeout' "$LATEST" || true
echo "--- STDOUT ---"
sed -n '/<stdout>/,/<\/stdout>/p' "$LATEST" | sed -n '1,400p' || true
echo "--- STDERR ---"
sed -n '/<stderr>/,/<\/stderr>/p' "$LATEST" | sed -n '1,400p' || true
