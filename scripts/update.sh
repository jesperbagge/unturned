#!/usr/bin/env bash

# fix permissions recursively from /minecraft based on a temp reffile created at run-time
# there are shitloads of examples on how to do this on Github but I figured this one out
# by myself and it seems to be the simplest one... :)
touch reffile
chown -R --reference=reffile ${UNTURNED_REPO}
chown -R --reference=reffile ${STEAMCMD_REPO}
rm reffile

# run steamcmd with parameters to update Unturned
${STEAMCMD_REPO}/steamcmd.sh +@sSteamCmdForcePlatformBitness 32 +login "$STEAM_USER" "$STEAM_PWD" +force_install_dir ${UNTURNED_REPO} +app_update 304930 validate +exit

# update rocket
cd ${UNTURNED_REPO}
mkdir -p update_rocket
cd update_rocket
wget -N -q "https://ci.rocketmod.net/job/Rocket.Unturned%20Linux/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip"
unzip Rocket.zip
mv *.dll ${UNTURNED_REPO}/Unturned_Headless_Data/Managed/
mv *.exe ${UNTURNED_REPO}/
cd ..
rm -rf update_rocket

# start server


