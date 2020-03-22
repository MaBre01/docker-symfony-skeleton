build:
	docker build -t MaBre01/docker-symfony-php .docker/php
	docker build -t MaBre01/docker-symfony-nginx .docker/nginx

push:
	docker push MaBre01/docker-symfony-php
	docker push MaBre01/docker-symfony-nginx

.PHONY: build push