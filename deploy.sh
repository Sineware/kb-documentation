#!/usr/bin/env bash
USER=swadmin
HOST=192.168.11.184
PORT=22
DIR=/home/swadmin/sineware-knowledge-base

rsync -e "ssh -p ${PORT}" -avz --exclude="tmp" --exclude ".git" --exclude "node_modules" --exclude "build" --exclude "output" . ${USER}@${HOST}:${DIR}