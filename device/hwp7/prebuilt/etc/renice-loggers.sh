#!/system/bin/sh

if [ ! -n "$1" ]; then
    echo "Usage: $0 <proc-name> [[proc-name] ...]"
    exit 1
fi

if [ -e /data/log/dont-renice-loggers ]; then
    exit 0
fi

pids=$(pidof ${@})

for pid in $pids; do
    renice 19 $pid
    ionice $pid idle 7
done
