# define base image
FROM node:12
# create env vars
ENV PORT=3000
# cr8 app dir
WORKDIR /usr/src/app
# copy manifest
COPY package*.json ./
# install dependencies for production/CICD
RUN npm ci --only=production
# ensure vulnerabilities are fixed
RUN npm audit fix --force
# copy source code
COPY . .
# expose target port
EXPOSE $PORT
# make the service an executable
ENTRYPOINT [ "npm", "start" ]