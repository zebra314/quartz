FROM node:20-slim as builder
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

# # list all the repositories that are tracked
# RUN git remote -v
 
# # if the origin doesn't match your own repository, set your repository as the origin
# git remote set-url origin REMOTE-URL  
 
# # if you don't have upstream as a remote, add it so updates work
# git remote add upstream https://github.com/jackyzha0/quartz.git

FROM node:20-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/

RUN apt-get update && apt-get install -y git
RUN git config --global --add safe.directory /usr/src/app

CMD ["npx", "quartz", "build", "--serve"]
