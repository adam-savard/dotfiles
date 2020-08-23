function kill-chrome
                 echo "Restarting Chrome..."
                 pkill --oldest chrome & rm -rf ~/.cache/google-chrome
                 # Resets the node apps. This could possible be a huge slowdown.
 # This REQUIRES my other gists, reset-node.fish and start-node.fish
                 reset-node
                 google-chrome-stable >/dev/null 2>&1 & disown
end
