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
