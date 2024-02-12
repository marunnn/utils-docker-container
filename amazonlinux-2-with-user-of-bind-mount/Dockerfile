FROM amazonlinux:2

ARG USER_NAME=user
ARG USER_PW=user

ENV USER_NAME=${USER_NAME}

RUN amazon-linux-extras install -y && \
    yum update -y && \
    yum install -y \
    curl \
    git \
    sudo \
    tar \
    vim && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN useradd ${USER_NAME} && \
    echo ${USER_NAME}:${USER_PW} | chpasswd && \
    echo '${USER_NAME} ALL=NOPASSWD: ALL' >> /etc/sudoers

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}