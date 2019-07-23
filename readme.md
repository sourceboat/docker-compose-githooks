# docker-compose-githooks

[![Docker Build Status](https://img.shields.io/docker/cloud/build/sourceboat/docker-compose-githooks.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/docker-compose-githooks/builds/)
[![Release](https://img.shields.io/github/release/sourceboat/docker-compose-githooks.svg?style=flat-square)](https://github.com/sourceboat/docker-compose-githooks/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceboat/docker-compose-githooks.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/docker-compose-githooks/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/sourceboat/docker-compose-githooks.svg?style=flat-square)](https://microbadger.com/images/sourceboat/docker-compose-githooks)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/sourceboat/docker-compose-githooks.svg?style=flat-square)](https://microbadger.com/images/sourceboat/docker-compose-githooks)

Easily manage and version control [Git Hooks](https://git-scm.com/book/de/v1/Git-individuell-einrichten-Git-Hooks)
in a [Docker Compose](https://docs.docker.com/compose/) setup.

## Usage

Add a new service to your  `.docker-compose.yml` file:

```yml
version: '3.7'
services:
  
  // ...
  
  githooks:
    image: sourceboat/docker-compose-githooks:stable
    volumes:
      - ./.git:/tmp/.git
      - ./.githooks:/tmp/.githooks
```

Now you can manage and version control your Git Hooks in the `.githooks` directory of your repository.
Everytime you run `docker-compose up` the `githooks` service will create symlinks in `.git/hooks` to all files found in the `.githooks` directory.

For example you can create a `.githooks/pre-commit` file to run your linters inside your running containers:

```sh
#!/bin/sh
echo 'running pre-commit hook...'
docker-compose exec -T app yarn lint
```

## Changelog

Check [releases](https://github.com/sourceboat/docker-compose-githooks/releases) for all notable changes.

## Credits

- [Phil-Bastian Berndt](https://github.com/pehbehbeh)
- [All Contributors](https://github.com/sourceboat/docker-compose-githooks/graphs/contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
