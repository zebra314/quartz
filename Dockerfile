FROM node:20-slim as builder
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

FROM node:20-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/

# Install git 
RUN apt-get update && apt-get install -y git
RUN git config --global --add safe.directory /usr/src/app

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

CMD ["npx", "quartz", "build", "--serve"]
