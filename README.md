# Canvas Self-Hosted

> [!WARNING]  
> This tooling is in an alpha state and should not be relied up for an actual
> production deployment.

This repository contains the scripts necessary to maintain a production-style
canvas deployment on a single machine with Docker/Docker Compose. At present
this only configures Canvas proper, and not any auxiliary services such as the
Rich Content Service.

## Getting Started

Run `./setup.sh`. This will prompt you for some pieces of information necessary
to configure your new canvas installation. When it completes run `docker compose
up -d`, and Canvas will now be running on port 3000. You will probably want to
add a reverse proxy (e.g. nginx) in front of Canvas to add SSL and serve it from
regular HTTP ports.

## Updating canvas

Pull the latest version of the repository and run `./update.sh`, and then run
`docker compose up -d` when it is complete to start Canvas again.
