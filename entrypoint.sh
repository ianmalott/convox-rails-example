#!/bin/bash
set -e

# Delete old server.pid
rm -f /app/tmp/pids/server.pid

for f in $HOME/.profile.d/*; do source $f; done

if [ "$#" -gt 0 ]; then
	exec "$@"
else
	exec /bin/bash
fi
