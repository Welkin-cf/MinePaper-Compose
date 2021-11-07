#!/bin/bash

ES=Essentials
ES_VER=2.19.0
ES_DL=https://github.com/EssentialsX/Essentials/releases/download/$ES_VER/${ES}

AUTHLIB=authlib-injector
AL_ORD=39
AL_VER=1.1.$AL_ORD
AL_DL=https://authlib-injector.yushi.moe/artifact/$AL_ORD/$AUTHLIB-$AL_VER.jar

PLUGINS_DIR=./$DATA_DIR/plugins/
mkdir -p $PLUGINS_DIR

function dles {
    wget -P $PLUGINS_DIR \
        ${ES_DL}X-$ES_VER.jar \
        ${ES_DL}XChat-$ES_VER.jar \
        ${ES_DL}XSpawn-$ES_VER.jar
}

function dlal {
    wget --no-check-certificate -O $PLUGINS_DIR$AUTHLIB.jar $AL_DL
}

case "$1" in
dles)
    dles
    ;;
dlal)
    dlal
    ;;
dl)
    dles
    dlal
    ;;
esac

# sudo DATA_DIR=minecraft-paper-data bash plugins_dl.sh dl
