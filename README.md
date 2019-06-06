# docker-compose-scanners

To start all siwecos scanners on your local machine, install Docker and docker-compose,
clone this repo and run `docker-compose up` inside the repo's directory.

This repo is still under heavy development and at the moment not ready for use in production environments.


## Usage
Start the SIWECOS base components via

```
docker-compose up
```

This command will start the [SIWECOS Core-API](https://github.com/SIWECOS/siwecos-core-api), all scanners and a callback server.
All components get a port mapping to the host system so one can either start a complete scan by sending a [scan start request](https://github.com/SIWECOS/siwecos-core-api/tree/develop#request-interface) to the Core-API or a single scan by sending this request to one of the scanners.


The following components are included at the moment:

| Name                                                                  | Port-Mapping |
| --------------------------------------------------------------------- | ------------ |
| [Callback Server](https://github.com/SIWECOS/callback-server)         | 3000         |
| [SIWECOS Core-API](https://github.com/SIWECOS/siwecos-core-api)       | 8000         |
| [BLACKLIST Scanner](https://github.com/SIWECOS/Ini-S-Scanner)         | 8090         |
| [HSHS-DOMXSS Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner) | 8091         |
| [INFOLEAK Scanner](https://github.com/SIWECOS/InfoLeak-Scanner)       | 8093         |
| [PORT Scanner](https://github.com/SIWECOS/WS-Port-Scanner)            | 8094         |
| [TLS Scanner](https://github.com/SIWECOS/WS-TLS-Scanner)              | 8095         |
| [VERSION Scanner](https://github.com/SIWECOS/Version-Scanner)         | 8096         |

## Quickstart
You can do a quick-scan for a bunch of domains with the running as follows:

1. Fill the `domainList.txt` with one domain per line
2. Run the `scan-domains.sh` script

The `scan-domain.sh` script allows different start parameters.
You can either run `ALL` tests by using the [SIWECOS Core-API] or run a specific scanner by its name: `DOMXSS`, `HEADER`, `INFOLEAK`, `PORT`, `HTTPS`, `MAIL` or `VERSION`

The Results will be saved in the `data/scans.json` file.
You can either open this file directly or check `http://localhost:3000/scans`.
