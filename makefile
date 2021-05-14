up:
		docker-compose up -d
build:
		docker-compose build
laravel-install:
		docker-compose exec app composer create-project --prefer-dist laravel/laravel .
create-project:
		@make build
		@make up
		@make laravel-install
		docker-compose exec app php artisan key:generate
stop:
		docker-compose stop
restart:
		docker-compose down
		docker-compose up -d
down:
		docker-compose down
ps:
		docker-compose ps
app:
		docker-compose exec app bash
db:
		docker-compose exec db bash
sql:
		docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'