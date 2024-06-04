#!/usr/bin/env bash
set -e

echo "Created $(docker volume create --name=canvas-brandable_css)."
echo "Created $(docker volume create --name=canvas-files)."
echo "Created $(docker volume create --name=canvas-postgres)."

if [ ! -f .env.canvas ]; then
  echo "ENCRYPTION_KEY=$(xxd -l "20" -p /dev/urandom | tr -d " \n")" >> .env.canvas
  read -rp "Enter the domain canvas will be hosted at: " canvas_host
  echo "RAILS_HOST_WITH_PORT=${canvas_host}" >> .env.canvas
fi

docker compose build
docker compose run --rm -e "UPDATE_ENCRYPTION_KEY_HASH=1" web bin/rails db:create db:migrate
docker compose run --rm -e "UPDATE_ENCRYPTION_KEY_HASH=1" web bin/rails db:initial_setup brand_configs:generate_and_upload_all
echo "To start Canvas, run docker compose up -d"