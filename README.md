# docker-netlify-cli

A Docker image for [netlify/cli][a].

[a]: https://github.com/netlify/cli

```sh
docker image pull williamjackson/netlify-cli
```

## Available tags

* `latest` &rarr; `2.40.0`
* `2.39.0`
* `2.38.0`
* `2.37.0`
* `2.36.0`

[Older tags are also available][b].

[b]: https://hub.docker.com/r/williamjackson/netlify-cli/tags

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
