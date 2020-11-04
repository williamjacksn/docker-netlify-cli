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
    williamjackson/netlify-cli \
    deploy
```
