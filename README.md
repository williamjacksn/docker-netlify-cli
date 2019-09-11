# [Netlify CLI][a] in Docker

This Docker image currently contains the Netlify CLI version **2.14.0**.

## To use this image

In your [Netlify user settings][b], create a personal access token. Set the environment variable `NETLIFY_AUTH_TOKEN`
inside the container.

The default working directory in the container is `/project`, so mount your project directory into the container at that
location.

Specify the Netlify CLI command after the image name.

```bash
docker container run -it \
    -e NETLIFY_AUTH_TOKEN=<personal_access_token> \
    -v /path/to/project:/project \
    williamjackson/netlify-cli \
    deploy
```

[a]: https://github.com/netlify/cli/
[b]: https://app.netlify.com/user/applications
