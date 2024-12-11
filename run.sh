#!/bin/bash

# Load environment variables from the .env file
if [ -f .env ]; then
  echo "Loading environment variables from .env file..."
  source .env
else
  echo ".env file not found!"
  exit 1
fi

# Define Saleor URL to check (using the environment variable from .env)
SALEOR_URL="${SALEOR_URL:-http://localhost:8000/graphql/}" 

# Function to wait for Saleor to respond
wait_for_saleor() {
  echo "Waiting for Saleor to respond at $SALEOR_URL..."
  until curl -s -o /dev/null -w "%{http_code}" "$SALEOR_URL" | grep -q "200"; do
    echo "Saleor not ready. Retrying in 5 seconds..."
    sleep 5
  done
  echo "Saleor is up and running!"
}

# Step 1: Start default services
echo "Starting default services..."
docker compose --profile backend up -d --build

# Step 2: Wait for Saleor to be ready
wait_for_saleor

# Step 3: Start frontend services
echo "Starting frontend services..."
docker compose --profile frontend up -d --build
