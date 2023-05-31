# Lamin + Docker

A rough attempt at Dockerizing the components of Lamin

## Introduction

Having all Lamin components Dockerized should accelerate local testing and evaluation of Lamin. We can launch a Postgres container for the database component and use [MinIO](https://hub.docker.com/r/minio/minio/) as an S3-compatible backend.

## Getting Started

Launch containers

```
$ docker compose up
```

Launch a Jupyter notebook on top of stack

```
$ docker compose -f docker-compose.dev.yml up
```

## Issues

This isn't working because LaminDB is configured to use AWS cloud endpoints. To use the MinIO container we will need to pass the container endpoint to LaminDB.
