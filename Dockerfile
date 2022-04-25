FROM centos:latest

LABEL vendor="Danbi Korea Corp."
LABEL maintainer="ec.park@danbicorp.com"

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.13.2
# install nvm
RUN mkdir /usr/local/nvm
RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 
# install node and npm
RUN source $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default
# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN npm install -g yarn

COPY . /home/ec2-user/node-systemd-timer
WORKDIR /home/ec2-user/node-systemd-timer

# install deps
RUN yarn
# transpile typescript
RUN yarn build

RUN sh /home/ec2-user/node-systemd-timer/services/local/installLocalSchedulers.sh

CMD ["/usr/sbin/init"]
