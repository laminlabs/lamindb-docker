# Lamin + Docker

A rough attempt at Dockerizing the components of Lamin

## Introduction

Having all Lamin components Dockerized should accelerate local testing and evaluation of Lamin. We can launch a Postgres container for the database component and use [MinIO](https://hub.docker.com/r/minio/minio/) as an S3-compatible backend.

Postgres is also running in a container. The data volume is mapped to `postgres-data` so when you relaunch the containers the data should persist.

## Prerequisites

### Docker

You will need to have `Docker` and `docker compose` installed on your system. Easiest way is to install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

### AWS

Since you will need to access AWS resources when working with a Lamin instance, you will need to pass your AWS credentials to the Docker container via environment variables or your `~/.aws` folder. Make sure your `~/.aws/config` contains the `lamin` profile (or you can name it whatever you want, but you will have to update the value in the docker-compose.yml accordingly):

```
[profile lamin]
region=us-east-1
```

and your `~/.aws/credentials` contains your CLI secrets:

```
[lamin]
aws_access_key_id = **********
aws_secret_access_key = **********
```

### AWS Vault

Even, better, use [AWS Vault](https://github.com/99designs/aws-vault) to secure your credentials using your system's keystore so there are no plaintext secrets on your file system.

```
$ aws-vault add lamin
Enter Access Key Id: ********
Enter Secret Key: ********
```

## Getting Started

Environment

Need a `.env` file with your LaminDB password

```
LAMINDB_PASSWORD=**********************
```

Build image

```
$ docker compose build
```

Launch a Jupyter notebook on top of stack

```
$ docker compose up
```

of if you use AWS Vault (you will be prompted to enter your system password)

```
$ aws-vault exec lamin -- docker compose up
```

This will create a notebook launched in the container that can be accessed via localhost:8888 (make sure you don't have duplicate Jupyter notebooks running on that port)

## Issues

MinIO isn't working yet. To use the MinIO container we will need to pass the container endpoint to LaminDB.
