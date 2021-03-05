# Bookinfo Rating Service

Rating service has been developed on NodeJS

## How to run with Docker

```bash
sudo CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip3 install docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.28.5/contrib/completion/bash/docker-compose \
  -o /etc/bash_completion.d/docker-compose
docker-compose version
docker-compose up
```

* Test with path `/ratings/1` and `/health`
