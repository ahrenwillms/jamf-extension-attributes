#!/bin/bash

# Returns the installed Visual Studio Code extensions and their version numbers for the currently logged in user

LOGGED_IN_USER=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )
CODE_BINARY_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
CODE_EXTENSIONS=$(sudo -u "$LOGGED_IN_USER" "$CODE_BINARY_PATH" --list-extensions --show-versions)

echo "<result>$CODE_EXTENSIONS</result>"