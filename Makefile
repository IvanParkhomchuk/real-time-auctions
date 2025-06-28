.PHONY: help up stop reset enter logs

help: ## show this dictionary
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: ## run application in demon mode
	docker-compose up -d

stop: ## stop application
	docker-compose down

reset: ## build and up all application
	docker-compose down -v && docker-compose build && docker-compose up -d

enter: ## enter backend container
	docker-compose exec auction-service bash

logs: ## backend container logs
	docker-compose logs auction-service