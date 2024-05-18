FROM --platform=linux/amd64 node:18-slim
# --platform=linux/amd64

RUN apt-get update \
       && apt-get -y upgrade \
       && apt-get -y install npm bash
       # curl inetutils-ping nano

# Create app directory
RUN mkdir -p /app
RUN mkdir -p /apptmp
WORKDIR /apptmp

# copy essential files
# app.js yxc_api_cmd_modified.js package.json
COPY app.js yxc_api_cmd_modified.js package.json ./

# volume path to persistant data
VOLUME [ "/app" ]

# add start shell script
ADD start.sh ./
RUN chmod +x ./start.sh
ENTRYPOINT ./start.sh
