FROM jupyter/base-notebook:python-3.10

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git curl unzip graphviz \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

RUN pip install lamindb[bionty,jupyter]==0.52.1
RUN pip install laminci

RUN python -c "from laminci.nox import login_testuser1, login_testuser2; login_testuser1(); login_testuser2()"
