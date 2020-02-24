NAME=skriptfabrik/docker-with-compose

.PHONY: default
default: lint build

.PHONY: lint
lint:
	@echo 'Linting Dockerfile'
	@docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: build
build:
	@echo "Building docker image"
	@DOCKER_BUILDKIT=1 docker build \
		--force-rm \
		--no-cache \
		--tag ${NAME}:dev \
		.

.PHONY: clean
clean:
	@echo "Cleaning up docker images..."
	-@docker rmi --force $(shell docker images ${NAME}:dev -q)
