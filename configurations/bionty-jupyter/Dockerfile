FROM jupyter/base-notebook:python-3.10

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

RUN pip install lamindb[bionty,jupyter]==0.44.1
