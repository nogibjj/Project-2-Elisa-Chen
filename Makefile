install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	./test.sh

lint:
	docker run --rm -i hadolint/hadolint < ./CLI/main.sh 

all: install test lint