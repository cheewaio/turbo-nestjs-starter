# Turborepo starter with NestJS and PNPM

This is a starter monorepo for developing NestJS backend using Turborepo and PNPM.

## What's inside

This monorepo using PNPM as the package manager and Turborepo as the build system tool.

### Apps and libraries

- **apps/backend** - main NestJS appplication
- **libs/common** - shared library

## Creating a new repo from this starter

```bash
pnpm dlx create-turbo@latest -m pnpm -e https://github.com/cheewaio/turbo-nestjs-starter
```

## Setup

```bash
make setup
```

## Package dependencies

```bash
# Adding runtime dependencies
pnpm add <package> --filter <projct>

# Adding development dependencies
pnpm add -D <package> -w

# Installing dependencies
pnpm install
```

## Build packages

```bash
# Build all packages
make build

# Clean build
make clean
```

## Running

```bash
# Development mode
make dev

# Production mode
make prod
```

## Testing

```bash
# Unit tests
make test

# Unit tests with coverage
make coverage

# End-to-end tests
make e2e
```
