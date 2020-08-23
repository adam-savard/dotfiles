# Defined in - @ line 2
function reset-node
	killall node
    rm ~/Citisketch/*.log
    start-node
end
