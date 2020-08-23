# Defined in - @ line 2
function no-work
	clear
    #loop
    while true
        set currentRow 0
        for i in (seq (tput lines))
            set colAmount (tput cols)
            set currentCol 0
            for i in (seq $colAmount)
                tput cup $currentRow $currentCol
                printf %i 0 | lolcat
                set currentCol (math $currentCol + 1)
            end
            set currentRow (math $currentRow + 1)
        end
    end
end
