dcbuild:
	docker compose build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)

dcbuildnc:
	docker compose build --no-cache --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)

dcup:
	docker compose up -d

dcd:
	docker compose down --remove-orphans

dcweb:
	docker exec -it web_default-project bash

security:
	symfony check:security

stan:
	vendor/bin/phpstan analyse --ansi --no-progress --error-format=table

cs:
	./vendor/bin/phpcs ./src -p -s -v --colors --no-cache

csfix:
	./vendor/bin/phpcbf ./src --no-cache

phan:
	./vendor/bin/phan -d  ./src --allow-polyfill-parser

churn:
	./vendor/bin/churn run ./src

md:
	./vendor/bin/phpmd ./src ansi phpmd.xml

ins:
	./vendor/bin/phpinsights

deptrac:
	./vendor/bin/deptrac analyse depfile.yaml --no-cache

dep-uml:
	./vendor/bin/dephpend uml --output=uml.png ./src

dep-dsm:
	./vendor/bin/dephpend dsm ./src > dependencies.html

dep-metrics:
	./vendor/bin/dephpend metrics ./src

metrics:
	./vendor/bin/phpmetrics --report-html="./report" ./src

behat:
	./vendor/bin/behat --snippets-for --colors

entity:
	php bin/console make:entity

form:
	php bin/console make:form

controller:
	php bin/console make:controller

migration:
	php bin/console make:migration

migrate:
	php bin/console doctrine:migrations:migrate

fixtures:
	php bin/console doctrine:fixtures:load

test:
	php bin/phpunit

