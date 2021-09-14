#-----------------------------------------------------------
# for local
stop-local-services:
	sudo systemctl stop apache2
	sudo systemctl stop mysql

start-local-services:
	sudo systemctl start apache2
	sudo systemctl start mysql

#-----------------------------------------------------------
# docker
up: docker-up
down: docker-down
restart: down up
init: docker-pull docker-build docker-up composer-install

docker-up:
	docker-compose up -d
docker-down:
	docker-compose down --remove-orphans
docker-pull:
	docker-compose pull
docker-build:
	docker-compose build

#-----------------------------------------------------------
# composer
composer-install:
	docker-compose run --rm php-cli composer install
composer-update:
	docker-compose run --rm php-cli composer update

#-----------------------------------------------------------
# php artisan
key:
	docker-compose run --rm php-cli php artisan key:generate
migrate:
	docker-compose run --rm php-cli php artisan migrate
seed:
	docker-compose run --rm php-cli php artisan db:seed
