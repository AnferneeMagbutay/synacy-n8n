ENVFILE ?= .env.example

.PHONY: envFile
envFile:
	cp $(ENVFILE) .env

.PHONY: start
start:
	$(MAKE) envFile
	docker compose up -d

.PHONY: stop
stop:
	docker compose down

.PHONY: logs
logs:
	docker compose logs -f n8n

.PHONY: restart
restart:
	$(MAKE) stop
	$(MAKE) start

.PHONY: clean
clean:
	docker compose down -v
