#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage $0 <target_dir> <env_name>"
    exit 1
fi

target=$1/.dir-locals.el
cat <<EOF > $target
((python-mode . ((activated-virtualenv . "$2")
                 (buildout-root-dir . "$1"))))
EOF
