> [!IMPORTANT]
> This repository is archived because I no longer actively use this software. If you have a question about this repo,
> or you are interested in maintaining it yourself, please [open an issue on my personal repository][x].

[x]: https://github.com/williamjacksn/williamjacksn/issues

# docker-netlify-cli

A Docker image for [netlify/cli][a].

[a]: https://github.com/netlify/cli

```sh
docker image pull ghcr.io/williamjacksn/netlify-cli
```

This image is also available [on Docker Hub][b] as `williamjackson/netlify-cli`.

[b]: https://hub.docker.com/r/williamjackson/netlify-cli

## Usage

In your [Netlify user settings][c], create a personal access token. Set the environment variable `NETLIFY_AUTH_TOKEN`
inside the container.

[c]: https://app.netlify.com/user/applications

The default working directory in the container is `/project`, so mount your project directory into the container at that
location.

Specify the Netlify CLI command after the image name.

```sh
docker container run -it \
    -e NETLIFY_AUTH_TOKEN=<personal_access_token> \
    -v /path/to/project:/project \
    ghcr.io/williamjacksn/netlify-cli \
    deploy
```

## Compose

```yaml
# compose.yaml

services:
  netlify-cli:
    image: ghcr.io/williamjacksn/netlify-cli
    environment:
      NETLIFY_AUTH_TOKEN: <personal_access_token>
    volumes:
      - /path/to/project:/project
```

```sh
docker compose run netlify-cli deploy
```

### A note on versions

The netlify/cli project publishes new versions multiple times a day, but this image is only updated roughly once a day.
If you want to pin a version, and I suggest you do, check the [releases][d] section of this repository to see what
versions are available.

[d]: https://github.com/williamjacksn/docker-netlify-cli/releases
