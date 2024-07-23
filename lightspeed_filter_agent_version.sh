#!/bin/bash

# An extension attribute to determine the currently installed version of the Lightspeed Filter Agent

# Credit to Paul Galow for his getJsonValue() function: https://paulgalow.com/how-to-work-with-json-api-data-in-macos-shell-scripts/
getJsonValue() {
  # $1: JSON string to parse, $2: JSON key to look up
  JSON="$1" osascript -l 'JavaScript' \
    -e 'const env = $.NSProcessInfo.processInfo.environment.objectForKey("JSON").js' \
    -e "JSON.parse(env).$2"
}

# Default return value if the agent is not installed
FILTER_AGENT_VERSION="Not Installed"

if [ -f "/Applications/.lightspeed-agent/manifest.json" ]; then

    # Read Lightspeed Agent manifest file into a variable
    LIGHTSPEED_MANIFEST="$(< /Applications/.lightspeed-agent/manifest.json)"

    # Parse out the version string
    FILTER_AGENT_VERSION=$(getJsonValue "$LIGHTSPEED_MANIFEST" 'version')

fi

# Print the result string for the extension attribute
echo "<result>$FILTER_AGENT_VERSION</result>"
