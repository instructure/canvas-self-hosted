#!/usr/bin/env bash

docker compose stop
docker compose build
docker compose run --rm web bin/rails db:migrate brand_configs:generate_and_upload_all
echo "To start Canvas, run docker compose up -d"