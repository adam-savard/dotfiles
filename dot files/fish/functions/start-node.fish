# Defined in - @ line 2
function start-node
	set -l originalDir (pwd)
    cd ~/Citisketch/Map-Asset-DB-and-API/
    nohup node app.js >../api.log 2>&1 &
    disown
    cd ~/Citisketch/CampaignBrowser/Browser/
    nohup node server.js >../../server.log 2>&1 &
    disown
    cd ~/Citisketch/CampaignBrowser/Browser/client/src/
    nohup npm start >../../../../browser.log 2>&1 &
    disown
    cd ~/Citisketch/CitiSketch/TransitHero/
    nohup node app.js >../../Citisketch.log 2>&1 &
    disown
    cd $originalDir
end
