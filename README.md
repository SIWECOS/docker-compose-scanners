## docker-compose-scanners

This repo ist for local testing purposes only.

To start all siwecos scanners on your local machine, install Docker and docker-compose,
clone this repo and run `docker-compose up -d` inside the repo's directory.

### Included Scanners

| Scanner | Standard Port | Standard Route |
|---------|:-------------:|----------------|
| [Header Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner)              | 8090 | http://localhost:8090/api/v1/header
| [DOMXSS Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner)              | 8090 | http://localhost:8090/api/v1/domxss
| [Information Leakage Scanner](https://github.com/SIWECOS/InfoLeak-Scanner)    | 8091 | http://localhost:8091/
| [WS TLS Scanner](https://github.com/SIWECOS/WS-TLS-Scanner)                   | 8092 | http://localhost:8092/start


