FROM python:3.9.0-buster
LABEL maintainer="alexbucknall@balena.io"
LABEL description="Minimal SKiDL + KiCad + Freerouting + balenaLibs image based on Debian"
ARG FREEROUTING_VERSION="1.4.4"
ARG BALENALIBS_VERSION="latest"

# Install KiCAD
RUN echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y install -t buster-backports --no-install-recommends kicad kicad-libraries software-properties-common && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /usr/share/icons/Adwaita/

# Install Freerouting
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list && \
    apt-get -y update && \
    apt-get -y install openjdk-11-jre wget && \
    wget -qO freerouting.zip "https://github.com/freerouting/freerouting/releases/download/v${FREEROUTING_VERSION}/freerouting-${FREEROUTING_VERSION}-linux-x64.zip" && \
    unzip -d freerouting freerouting.zip && \
    cp freerouting/freerouting-${FREEROUTING_VERSION}-linux-x64/lib/app/freerouting-executable.jar freerouting.jar

# Install SKiDL
RUN pip install --upgrade pip && \
    pip install skidl


