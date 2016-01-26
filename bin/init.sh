#!/usr/bin/env bash

set -e
set -x

target_root=/two/test
favorite_user=egga

dir_names=( bin src cfg doc )
for dir_name in "${dir_names[@]}"
do
    target_dir_path=${target_root}/${dir_name}
    echo "################ Creating" $dir_name "->" $target_dir_path
    mkdir -p $target_dir_path
    chown egga $target_dir_path
    script_dir=`dirname $0`
    source_path=`dirname $script_dir`/$dir_name
    echo $source_path
    # TODO copy as user
    # TODO support links
    cp $source_path/* $target_dir_path/
done
# TODO do for all bin folders in client setup
# ln -s /two/cfg/client-setup/post/bin/* ~/bin
