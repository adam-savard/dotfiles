# Defined in /tmp/fish.vVWfKB/setupMachine.fish @ line 2
function setupMachine
	echo "Installing google chrome..."
pm google-chrome
echo "Installing yaourt"
pm yaourt
echo "Editing yaourtrc to ignore custom commands..." 
echo -e "NOCONFIRM=1\nBUILD_NOCONFIRM=1\nEDITFILES=0" > ~/.yaourtrc
echo "Installing peek..."
pm peek
echo "Installing VS Code. Please select visual-studio-code-bin when prompted."
yaourt visual-studio-code-bin
echo "Installing snapd. Slack requires snap support."
pm snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
echo "Snap installed. Installing Slack..."
sudo snap install slack --classic
echo "Installing Shutter."
echo -e "\e[5mWARNING!"
echo "This will take some time! Select shutter from the prompt"
yaourt shutter
echo "Installing VLC. Select vlc-git from the prompt."
yaourt vlc-git

# Configure git and then clone Citisketch
clear
echo "We'll now need your git username, email and password. Please enter it when prompted."

incorrect = 0
while incorrect
uName = read -P "Username: "
email = read -P "Email: "
pWord = read -P -s "Password: "
echo -e "\n\nYou have entered the following:\n\nUsername: $uName\nEmail: $email\nPassword: [protected]\n\nPlease indicate if this is correct".
if read_confirm "Is the information above correct"
incorrect = 1
end 
end

echo "Setting up git to have credentials stored..."
git config --global credential.helper store
echo "Storing login credentials..."
git config --global user.name "$uName"
git config --global user.email "$email"
git config --global user.password "$pWord"

echo "Cloning Citisketch into /home/$USER/Citisketch..."
mkdir /home/$USER/Citisketch
cd /home/$USER/Citisketch
git clone https://github.com/blackarcs/CitiSketch.git

echo "Setting up Apache..."
pm apache
sed -i 's/User http/User $USER/g' /etc/httpd/conf/httpd.conf
sed -i 's/Group http/Group $USER/g' /etc/httpd/conf/httpd.conf
sed -i 's;"/srv/http";"/home/$USER/Citisketch/CitiSketch/TransitHero";g'

sudo systemctl enable httpd

echo "Installing qBittorrent..."
pm qbitrorrent

clear
echo "The next step is OPTIONAL. This script uses the Friendly Interactive Shell (FISH). Would you like to make FISH your default shell?"
if read_confirm "Change from Bash to Fish"
chsh -s /usr/local/bin/fish
end
end
