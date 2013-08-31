#!/bin/sh

case $1 in
   config)
        cat <<'EOM'
graph_title ADSL Connection Speed
graph_vlabel speed (kbps)
graph_args -l 0
graph_scale no
up.label Upstream Rate
down.label Downstream Rate
EOM
        exit 0;;
esac

UP_RATE=$(curl http://192.168.1.1/cgi/cgi_status.js | grep "wan_up_rate.*'" | sed "s/.*'\(.*\)'.*/\1/")
DOWN_RATE=$(curl http://192.168.1.1/cgi/cgi_status.js | grep "wan_dn_rate.*'" | sed "s/.*'\(.*\)'.*/\1/")

echo -n "up.value "
echo $UP_RATE

echo -n "down.value "
echo $DOWN_RATE
