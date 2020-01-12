if !(cat ~/.bashrc | grep -c "alias atom" -q) then
  echo "\n" >> ~/.bashrc
  echo "# Setting a proxy for the atom command in order to use profiles" >> ~/.bashrc
  echo "alias atom=\"$(pwd)/atom.sh\"" >> ~/.bashrc

  # Activate the atom proxy for the current shell process
  alias atom="$(pwd)/atom.sh"

  # Make it executable without the need to sudo
  chmod a+x "$(pwd)/atom.sh"
fi

echo "Setting atom proxy done!"
sh ./install-packages.sh
