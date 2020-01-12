path_of_current_script=$(dirname "$0")
profiles_dir="$path_of_current_script/profiles"

#basename leaves only the name of the found directory
profiles=$(find $profiles_dir -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

for profile in $profiles
do
    export ATOM_HOME="$profiles_dir/$profile"

    echo " > Installing common packages into profile: $profile"
    apm install --packages-file "$path_of_current_script/atom-packages.txt"

    echo " > Installing profile specific packages into profile: $profile"
    apm install --packages-file "$profiles_dir/$profile/atom-packages.txt"
done
