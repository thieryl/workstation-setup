#!/bin/bash

# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <rpm|tar> <jdk_version>
# jdk_version: default 8
# rpm

EXT=${1:-rpm}
JDK_VERSION=${2:-8}

if [ -n "$1" ]; then
  if [ "$1" == "tar" ]; then
    EXT="tar.gz"
  fi
fi

URL="http://www.oracle.com"
JDK_DOWNLOAD_URL1="${URL}/technetwork/java/javase/downloads/index.html"
JDK_DOWNLOAD_URL2=`curl -s $JDK_DOWNLOAD_URL1 | egrep -o "\/technetwork\/java/\javase\/downloads\/jdk${JDK_VERSION}-downloads-.+?\.html" | head -1`
if [ -z "$JDK_DOWNLOAD_URL2" ]; then
  echo "Could not get jdk download url - $JDK_DOWNLOAD_URL1"
  exit 1
fi

JDK_DOWNLOAD_URL3="${URL}${JDK_DOWNLOAD_URL2}"
JDK_DOWNLOAD_URL4=`curl -s $JDK_DOWNLOAD_URL3 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\/[7-8]u[0-9]+\-(.*)+\/jdk-[7-8]u[0-9]+(.*)linux-x64.${EXT}"`

wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  $JDK_DOWNLOAD_URL4
