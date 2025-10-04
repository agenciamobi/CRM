.PHONY: up down logs sh install migrate seed test pint stan horizon

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f

sh:
	docker compose exec php bash

install:
	docker compose exec php bash -lc "bash scripts/install.sh"

migrate:
	docker compose exec php bash -lc 'php artisan migrate'

seed:
	docker compose exec php bash -lc 'php artisan db:seed --class=DemoSeeder'

test:
	docker compose exec php bash -lc 'php artisan test || ./vendor/bin/pest'

pint:
	docker compose exec php bash -lc './vendor/bin/pint'

stan:
	docker compose exec php bash -lc './vendor/bin/phpstan analyse --memory-limit=1G'

horizon:
	docker compose exec php bash -lc 'php artisan horizon'
