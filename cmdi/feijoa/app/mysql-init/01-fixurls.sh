#!/bin/bash
set -e
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e \"USE challenge; UPDATE wp_options SET option_value='http://localhost:${SITE_PORT:-19033}' WHERE option_name IN ('siteurl','home');"
