#!/bin/bash
set -e
shopt -s extglob

if ! [ -e index.php -a -e bin/gpm ]; then
	echo >&2 "Grav not found in $(pwd) - copying now..."
	if [ "$(ls -A)" ]; then
		echo >&2 "WARNING: $(pwd) is not empty - press Ctrl+C now if this is an error!"
		( set -x; ls -A; sleep 10 )
	fi
  rsync -a /tmp/grav/ /var/www/html --exclude user
  if ! [ -e user/config/system.yaml ]; then
    echo >&2 "No userfiles found - copying now..."
    rsync -a /tmp/grav/user/ /var/www/html/user
  fi
  /var/www/html/bin/grav install
  chown -R www-data:www-data !(user)
  chown -R www-data:www-data user || true
	echo >&2 "Complete! Grav has been successfully installed"
fi

exec "$@"
