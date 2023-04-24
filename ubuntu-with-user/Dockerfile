FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    sudo \
    vim \
    curl \
    git

ARG UID=1000
ARG GID=1000
ARG UNAME=user
ARG GNAME=user
ARG PW=user

ENV UID=${UID} \
    GID=${GID} \
    UNAME=${UNAME} \
    GNAME=${GNAME}

RUN groupadd -g ${GID} ${GNAME} && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} -G sudo ${UNAME} && \
    echo ${UNAME}:${PW} | chpasswd && \
    echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${UNAME}
WORKDIR /home/${UNAME}
