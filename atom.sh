#!/bin/bash
# Profiles path

atom_executable=$(which atom)
path_of_current_script=$(dirname "$0")
profiles_dir="$path_of_current_script/profiles"

echo $profiles_dir

#basename leaves only the name of the found directory
profiles=$(find $profiles_dir -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

select profile in $profiles
do
    export ATOM_HOME="$profiles_dir/$profile"
    break
done

echo "Set 'ATOM_HOME'=$ATOM_HOME"
$atom_executable $1
