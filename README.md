## docker-compose-scanners

This repo ist for local testing purposes only.

To start all siwecos scanners on your local machine, install Docker and docker-compose,
clone this repo and run `docker-compose up -d` inside the repo's directory.

### Included Scanners

| Scanner | Standard Port |
|---------|---------------|
| [Header Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner)              | 8090 |
| [DOMXSS Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner)              | 8091 |
| [Information Leakage Scanner](https://github.com/SIWECOS/InfoLeak-Scanner)    | 8092 |

You can access them via `http://localhost:<PORT>`
