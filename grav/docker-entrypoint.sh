#!/bin/bash
set -e
shopt -s extglob

if ! [ -e index.php -a -e user/config/system.yaml ]; then
  pwd
  ls -al
	echo >&2 "Grav not found in $(pwd) - copying now..."
	if [ "$(ls -A)" ]; then
		echo >&2 "WARNING: $(pwd) is not empty - press Ctrl+C now if this is an error!"
		( set -x; ls -A; sleep 10 )
	fi
  cp -r /tmp/grav/* /var/www/html/
  cp /tmp/grav/.htaccess /var/www/html/
	#tar cf - --one-file-system -C /tmp/grav . | tar xf -
  /var/www/html/bin/grav install
  #chown -R www-data:www-data /var/www/html
  echo "new"
  chown -R www-data:www-data !(user)
  #find /var/www/html -name user -prune -o -print0 | xargs -0 chown -R www-data:www-data
	echo >&2 "Complete! Grav has been successfully copied to $(pwd)"
  pwd
  ls -al
fi

exec "$@"
