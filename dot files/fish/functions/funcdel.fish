function funcdel
	if test -e ~/.config/fish/functions/$argv[1].fish
        rm ~/.config/fish/functions/$argv[1].fish
        echo 'Deleted function ' $argv[1]
    else
        echo 'Not found function ' $argv[1]
    end
end
