#!/bin/sh
#fork from https://github.com/TimWolla/docker-adminer/blob/master/4/entrypoint.sh

set -e

if [ -n "$ADMINER_DESIGN" ]; then
	# Only create link on initial start, to ensure that explicit changes to
	# adminer.css after the container was started once are preserved.
	if [ ! -e .adminer-init ]; then
		ln -sf "designs/$ADMINER_DESIGN/adminer.css" .
	fi
fi

touch .adminer-init || true

exec "$@"
