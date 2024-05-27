all: build test clean

build:
	docker build -t quartz:latest --squash .

test:
	docker run --rm -it \
		--net=host \
		--name quartz \
		--ulimit nofile=1024:524288 \
		--mount type=bind,source=$(CURDIR),target=/usr/src/app/ \
		quartz:latest \
		npx quartz build --serve

clean:
	docker rmi quartz:latest

push:
	make build
	docker run --rm -it \
		--net=host \
		--name quartz \
		--ulimit nofile=1024:524288 \
		--mount type=bind,source=$(CURDIR),target=/usr/src/app/ \
		-v $(HOME)/.gitconfig:/etc/gitconfig \
		-v $(HOME)/.ssh:/root/.ssh \
		quartz:latest \
		npx quartz sync --no-pull
	make clean

attach:
	docker exec -it quartz /bin/bash
