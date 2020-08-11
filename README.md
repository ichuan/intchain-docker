# intchain-docker
Dockerfile for intchain


# Building

```bash
docker build -t intchain .
```

# Running

```bash
# block dir
mkdir data
docker run --rm -itd --name int -p 8555:8555 -v `pwd`/data:/opt/data intchain
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/intchain/>:

```bash
docker run --rm -itd --name int -p 8555:8555 -v `pwd`/data:/opt/data mixhq/intchain
```
