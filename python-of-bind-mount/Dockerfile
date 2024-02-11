ARG PYTHON_VERSION=3.12.2-slim-bullseye
FROM python:${PYTHON_VERSION}

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    less \
    tar \
    vim && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /usr/local/src/*

WORKDIR /root/bind-mount

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt