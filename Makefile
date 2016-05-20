rmi: stop-test
	docker rmi izeni/sinopia 2>&1 > /dev/null

build:
	docker build -t izeni/sinopia:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage izeni/sinopia:latest
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t izeni/sinopia:latest

shell: build
	docker run --rm -i -t izeni/sinopia:latest /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push izeni/sinopia:latest

test: start-test
