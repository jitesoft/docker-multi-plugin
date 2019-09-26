# docker-multi-plugin

A simple CLI plugin (created mainly to test the capabilities of the go docker cli plugin api) which
allows to push and tag images with multiple arguments in one command!

Ever found the following annoying?

```bash
docker tag myimage:latest myimage:1.0.1.1.0
docker tag myimage:latest myimage:1.0.1.1
docker tag myimage:latest myimage:1.0.1
docker tag myimage:latest myimage:1.0
docker tag myimage:latest myimage:1

docker push myimage:latest
docker push myimage:1.0.1.1.0
docker push myimage:1.0.1.1
docker push myimage:1.0.1
docker push myimage:1.0
docker push myimage:1
```

Well, with the `multi` cli plugin, you could instead do this!

```bash
docker multi tag myimage:latest myimage:1.0.1.1.0 myimage:latest myimage:1.0.1.1  myimage:latest myimage:1.0.1 myimage:latest myimage:1.0 myimage:latest myimage:1
docker multi push myimage:latest myimage:1.0.1.1.0 myimage:latest myimage:1.0.1.1  myimage:latest myimage:1.0.1 myimage:latest myimage:1.0 myimage:latest myimage:1
```

Awesome right?!

## Installation

Either build the code yourself or download one of the binaries from the `releases` tab on github.  
Rename the plugin file to `docker-multi` and place it in the `~/.docker/cli-plugins` directory (or `%HOMEPATH%\.docker\cli-plugins` on windows).

```bash
PLUGINS=$HOME/.docker/cli-plugins
mkdir -p $PLUGINS

curl -L "https://github.com/jitesoft/docker-multi-plugin/releases/download/v0.0.1/docker-multi-plugin-$(uname -s)-amd64" -o $PLUGINS/docker-multi
chmod +x $PLUGINS/docker-multi
```

Run docker `docker multi --help`.

Done!

## License

MIT

No warranty, no liability.
