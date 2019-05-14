# docker-compose-scanners

To start all siwecos scanners on your local machine, install Docker and docker-compose,
clone this repo and run `docker-compose up -d` inside the repo's directory.

This repo is still under heavy development and at the moment not ready for use in production environments.


## Usage in `staging` environment
To check all SIWECOS base components in `staging` you can startup the essential infrastructure via

```
docker-compose -f develop.yml up
```

This command will start the [SIWECOS Core-API], all different scanners and a callback server.
All components get a port mapping to the host system so one can either start a complete scan by sending a [scan start request](https://github.com/SIWECOS/siwecos-core-api/tree/develop#request-interface) to the Core-API or a single scan by sending this request to one of the scanners.


The following components are included at the moment:

| Name                                                             | Port-Mapping |
| ---------------------------------------------------------------- | ------------ |
| [Callback Server](https://github.com/SIWECOS/callback-server)    | 3000         |
| [SIWECOS Core-API](https://github.com/SIWECOS/siwecos-core-api)  | 8000         |
| [BLACKLIST Scanner](https://github.com/SIWECOS/Ini-S-Scanner)    | 8090         |
| [DOMXSS Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner) | 8091         |
| [HEADER Scanner](https://github.com/SIWECOS/HSHS-DOMXSS-Scanner) | 8092         |
| [INFOLEAK Scanner](https://github.com/SIWECOS/InfoLeak-Scanner)  | 8093         |
| [PORT Scanner](https://github.com/SIWECOS/WS-Port-Scanner)       | 8094         |
| [TLS Scanner](https://github.com/SIWECOS/WS-TLS-Scanner)         | 8095         |
| [VERSION Scanner](https://github.com/SIWECOS/Version-Scanner)    | 8096         |
