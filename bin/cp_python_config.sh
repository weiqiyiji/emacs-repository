#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage $0 <target_dir> <env_name>"
    exit 1
fi

target=$1/.dir-locals.el
cp ~/.emacs.d/bundles/python/.dir-locals.el.sample $target
sed -i '' "s/env_name/$2/" $target
