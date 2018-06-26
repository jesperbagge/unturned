# Unturned 3 in a Docker container
This is a Docker image that when started, downloads SteamCMD for linux and creates an Unturned 3 server with a volume for persistent data.
The Unturned server runs on Rocket, which is also downloaded when started.

## Steam Requirements
To download the Unturned server, a valid Steam account has to be supplied. For this, the environment variables STEAM_USER and STEAM_PWD has to be filled with proper account details. Furthermore, if the account you supply has Steam Guard enabled, the download process will halt and ask you for a Steam Guard Key, which should automatically be mailed to your email that you used to set up your Steam account.
Alternatively, you can set up a new dummy Steam account without Steam Guard to use for download. The Steam account isn't used for running the server. Only to download the server files.

## Persistent game data
Each time you start the container Steam, Rocket and Unturned will update. You will need to restart the container about once per week, given Unturneds frequent updates. The folder housing the game data can be mounted to the host file system to enable data persistence and convenient access to config files.

## Volume
/gameserver/Servers/Dockerserver

## Ports
* 27016
* 27017

## Example
Start the container with the following command to mount your current directory as the folder to host your gamedata.
```docker
docker run -it -v "$PWD":/gameserver/Servers/Dockerserver --env STEAM_USER=<username> --env STEAM_PWD=<password> ramdad/unturned:latest
```
