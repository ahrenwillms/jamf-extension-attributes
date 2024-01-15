#!/bin/bash

# Check for presence of a Find My Mac token
FIND_MY_MAC_TOKEN=$(/usr/sbin/nvram -x -p | /usr/bin/grep fmm-mobileme-token-FMM)

if [ -z "$FIND_MY_MAC_TOKEN" ]; then
	echo "<result>Disabled</result>"
else
	echo "<result>Enabled</result>"
fi

exit 0