ARG AMAZONLINUX_VERSION=latest

FROM amazonlinux:${AMAZONLINUX_VERSION}

RUN amazon-linux-extras install -y

RUN yum update -y && \
    yum install -y \
    sudo \
    vim \
    curl \
    git

ARG UNAME=user
ARG PW=user

ENV UNAME=${UNAME}

RUN useradd ${UNAME} && \
    echo ${UNAME}:${PW} | chpasswd && \
    echo "${UNAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

USER ${UNAME}
WORKDIR /home/${UNAME}
