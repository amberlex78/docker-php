up: docker-up
down: docker-down
restart: down up
init: docker-pull docker-build docker-up composer-install

stop-local-services:
	sudo systemctl stop apache2
	sudo systemctl stop mysql

start-local-services:
	sudo systemctl start apache2
	sudo systemctl start mysql

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build

composer-install:
	docker-compose run --rm php-cli composer install

composer-update:
	docker-compose run --rm php-cli composer update

php-hello:
	docker-compose run --rm php-cli php bin/app.php
