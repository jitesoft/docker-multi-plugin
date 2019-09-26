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

## License

MIT

No warranty, no liability.