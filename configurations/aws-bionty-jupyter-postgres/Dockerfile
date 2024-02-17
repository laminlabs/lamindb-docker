FROM jupyter/base-notebook:python-3.11

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

RUN pip install lamindb[bionty,aws,jupyter]==0.67.3
