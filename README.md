# LaminDB Docker

A sample basic docker container with LaminDB components installed.


## Get started

You will need to have `Docker` and `docker compose` installed on your system. The easiest way is to install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

Build image:

```
$ docker compose build
```

Launch Jupyter Lab:

```
$ docker compose up
```


## Configurations

### aws-bionty-jupyter-postgres

This installs components for connecting to AWS, Bionty, Jupyter Notebook Tracking & Postgres.

## Components

### Jupyter notebooks

We use [jupyter/base-notebook](https://hub.docker.com/r/jupyter/base-notebook).

### AWS

Since you might need to access AWS resources when working with a Lamin instance, you will need to pass your AWS credentials to the Docker container via environment variables or your `~/.aws` folder.

#### Plain text

Make sure your `~/.aws/config` contains the `lamin` profile (or you can name it whatever you want, but you will have to update the value in the docker-compose.yml accordingly):

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

#### AWS Vault

Even, better, use [AWS Vault](https://github.com/99designs/aws-vault) to secure your credentials using your system's keystore so there are no plaintext secrets on your file system.

```
$ aws-vault add lamin
Enter Access Key Id: ********
Enter Secret Key: ********
```

If you use AWS Vault (you will be prompted to enter your system password)

```
$ aws-vault exec lamin -- docker compose up
```


## Postgres

We can launch a Postgres container for the database component. The data volume is mapped to `postgres-data` so when you relaunch the containers the data persists.


## MinIO

We will then use [MinIO](https://hub.docker.com/r/minio/minio/) as an S3-compatible backend. MinIO isn't working yet. To use the MinIO container we will need to pass the container endpoint to LaminDB. It's commented out in the `aws-bionty-jupyter-postgres` config.


## Binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/lawrlee/lamin-docker/HEAD)

This doesn't set up any postgres or MinIO containers, but does allow one to launch an environment with lamindb pre-installed.

