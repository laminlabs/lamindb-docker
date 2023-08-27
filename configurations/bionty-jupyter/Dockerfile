FROM jupyter/base-notebook:python-3.10

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

RUN pip install lamindb[bionty,jupyter]==0.51.0

RUN lamin login testuser1@lamin.ai --password cEvcwMJFX4OwbsYVaMt2Os6GxxGgDUlBGILs2RyS
RUN lamin login testuser2@lamin.ai --password goeoNJKE61ygbz1vhaCVynGERaRrlviPBVQsjkhz
