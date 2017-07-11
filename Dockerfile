FROM ubuntu
LABEL maintainer="jesperbagge@gmail.com"

# Define environment variables
ENV UNTURNED_REPO /unturned
ENV STEAM_USER anonymous
ENV STEAM_PWD ""
ENV INSTANCE_NAME testserver

# Create base folders
RUN mkdir -p $UNTURNED_REPO

# Copy scripts into the steamcmd repo
ADD scripts/* $UNTURNED_REPO

# Install necessary tools to run SteamCMD and Unturned
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    lib32stdc++6 \
    mono-runtime mono-reference-assemblies-2.0 \
    libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 \
    libc6-dev-i386 libgcc-4.8-dev:i386 \
    unzip \
    wget \
 && apt-get clean

# Open ports to the container
EXPOSE 27016/udp
EXPOSE 27017/udp

# Mount volume for persistence
VOLUME $UNTURNED_REPO

# Set workdir
WORKDIR $UNTURNED_REPO

# Update SteamCMD and Unturned
CMD ./build-server.sh
