THIS_FILE := $(lastword $(MAKEFILE_LIST))
PWD := $(shell pwd)

DC := docker compose -f docker-compose.yml
APP_CONTAINER := app  # Make sure to use service name, not container_name

.PHONY: help build up down destroy destroyall logs shell-laravel install-laravel serve

help:
	@make -pRrq -f $(THIS_FILE) : 2>/dev/null | \
		awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | \
		sort | egrep -v -e '^[^[:alnum:]]' -e '^$$'

## Build and start containers
build:
	$(DC) up -d --build

## Start containers
up:
	$(DC) --profile "*" up -d

## Stop containers
down:
	$(DC) --profile "*" down

## Destroy containers + volumes
destroy:
	$(DC) --profile "*" down -v

## Full cleanup
destroyall:
	$(DC) --profile "*" down --rmi all -v
	docker volume rm $$(docker volume ls -q)

## View logs
logs:
	$(DC) logs --tail=100 -f

## Shell into Laravel container
shell-laravel:
	$(DC) exec $(APP_CONTAINER) bash

## Install Laravel (v12)
install-laravel:
	$(DC) exec $(APP_CONTAINER) composer create-project laravel/laravel . "^12.0"

## Start Laravel development server
serve:
	$(DC) exec $(APP_CONTAINER) php artisan serve --host=0.0.0.0 --port=8000

## Start containers and serve Laravel
up-serve:
	$(DC) --profile "*" up -d
	$(DC) exec $(APP_CONTAINER) php artisan serve --host=0.0.0.0 --port=8000
