# Default make target
.DEFAULT_GOAL:=help

############################################################
##@ Commands
############################################################

.PHONY: build test

build: install ## Creates production build
	@ turbo build

clean: ## Clean up all temporary files
	@ turbo clean
	@ pnpm run clean

format: ## Formats all supported files
	@ turbo format

lint: ## Lints all supported files
	@ turbo lint

lint-staged: ## Lints all supported staged files and fix all the issues automatically
	@ pnpm dlx lint-staged

install: ## Installs NPM dependencies
	@ pnpm install

setup: ## Setup the environment for auto-linting staged files
	@ [ -f .vscode/launch.json ] || cp .vscode/launch.example.json .vscode/launch.json
	@ [ command -v pnpm > /dev/null 2>&1 ] || npm install -g pnpm
	@ [ command -v turbo > /dev/null 2>&1 ] || npm install -g turbo
	@ pnpm install
	@ pnpm run setup

dev: ## Starts the application in development mode
	@ turbo dev

prod: ## Starts the application in production mode
	@ turbo prod

test: ## Runs unit tests
	@ turbo test

coverage: ## Runs unit tests with coverage
	@ turbo test:coverage

e2e: ## Runs end-to-end tests
	@ turbo test:e2e

release: ## Release the build
	@ pnpm run release

############################################################
##@ Help
############################################################
help: ## Display this help
	@ echo "Usage:\n  make \033[36m<target>\033[0m"
	@ awk 'BEGIN {FS = ":.*##"}; \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
