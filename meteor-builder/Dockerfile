FROM node:0.10.42-slim

RUN apt-get update && apt-get install curl -y && curl https://install.meteor.com | /bin/sh && \
  meteor update --release 1.3-modules-beta.8

CMD cd /myapp && meteor build ./build --directory
