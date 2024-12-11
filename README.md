<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Install Docker

You can use guide for docker [official page](https://docs.docker.com/engine/install/).

### Setup

1. Clone the this repo and open it
   ```sh
   git clone git@github.com:masterboda-team/guug-server.git
   cd guug-server
   ```
3. Clone another repos that uses for guug to current directory:
   ```sh
   git clone git@github.com:masterboda-team/saleor3.git
   git clone git@github.com:masterboda-team/dashboard3.git
   git clone git@github.com:masterboda-team/storefront3.git
   git clone git@github.com:masterboda-team/saleor-fileprint-app.git
   ```
4. Copy and fill `.env` file
   ```js
   cp .env.example .env
   ```
5. Run
   Manually (order is important):
   ```sh
   docker compose --profile backend up -d --build
   docker compose --profile frontend up -d --build
   ```
   Or with script:
   ```sh
   run.sh
   ```
6. Stop
   Manually:
   ```sh
   docker compose --profile all down
   ```
   Or with script:
   ```sh
   stop.sh
   ```
