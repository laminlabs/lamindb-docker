FROM jupyter/base-notebook:python-3.10

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git curl unzip \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install awscli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

USER jovyan

RUN pip install lamindb[bionty,aws,jupyter]==0.58.0

RUN lamin login testuser1@lamin.ai --password cEvcwMJFX4OwbsYVaMt2Os6GxxGgDUlBGILs2RyS
RUN lamin login testuser2@lamin.ai --password goeoNJKE61ygbz1vhaCVynGERaRrlviPBVQsjkhz
