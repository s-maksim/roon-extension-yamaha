#!/bin/bash

# Check folder existence
echo "Checking ..."
if test ! -w /app; then
    echo "Application folder /app not present or not writable"
    exit 1
fi

# copy files from /tmp to /app
echo "Copying ..."
cp /apptmp/*.js* /app/
cd /app

# install dependencies
echo "Installing..."
npm i -g npm@latest
npm install

echo "Starting..."
node app.js $ID
