#!/usr/bin/env bash

set -a

function mysum {
    echo "$1 + $2" | bc
}

set +a

for x in 1 2 3; do
    for y in 6 7 8; do
        echo "sleep 1 && mysum $x $y"
    done
done | xargs -t -n 1 -P 2 -I % bash -c "%"



for x in 1 2 3; do
    for y in 6 7 8; do
        echo "$x $y"
    done
done | xargs -t -n 1 -P 2 -I % bash -c "mysum %"

