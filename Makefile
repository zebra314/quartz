all: build test clean push

build:	
	docker build -t quartz:latest .

test:
	docker run --rm -it \
		--net=host \
		--name quartz \
		--ulimit nofile=1024:524288 \
		--mount type=bind,source=$(shell pwd),target=/usr/src/app/ \
		-v ~/.gitconfig:/etc/gitconfig \
		quartz:latest

push:
	docker exec -it quartz npx quartz sync --no-pull

clean:
	docker rmi quartz:latest

attach:
	docker exec -it quartz /bin/bash