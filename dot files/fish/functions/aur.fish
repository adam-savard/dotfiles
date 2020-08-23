# Defined in - @ line 2
function aur
	echo "Installing AUR Package $argv"

    git clone https://aur.archlinux.org/$argv.git

    echo "Finished cloning. Installing..."

    cd $argv/

    makepkg -sri

    echo "Removing installation files..."

    pwd | rm -rf

    echo "Complete!"
end
