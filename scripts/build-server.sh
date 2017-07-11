#!/usr/bin/env bash

# fix permissions recursively from /minecraft based on a temp reffile created at run-time
# there are shitloads of examples on how to do this on Github but I figured this one out
# by myself and it seems to be the simplest one... :)
touch reffile
chown -R --reference=reffile ..
rm reffile
cd ${UNTURNED_REPO}

# update Rocket
wget https://ci.rocketmod.net/job/Rocket.Unturned%20Linux/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip -O rocket.zip
unzip -o rocket.zip
rm rocket.zip

# Fix permissions and run the update script to install Unturned 3
cd Scripts
chmod 755 update.sh
chmod 755 start.sh
./update.sh ${STEAM_USER} ${STEAM_PWD}

# start server
./start.sh ${INSTANCE_NAME}

