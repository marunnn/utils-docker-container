ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION}

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=user
ARG GROUP_NAME=user
ARG PW=user

ENV USER_ID=${USER_ID} \
    GROUP_ID=${GROUP_ID} \
    USER_NAME=${USER_NAME} \
    GROUP_NAME=${GROUP_NAME}

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    git \
    sudo \
    vim && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /usr/local/src/*

RUN groupadd -g ${GROUP_ID} ${GROUP_NAME} && \
    useradd -m -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} -G sudo ${USER_NAME} && \
    echo ${USER_NAME}:${PW} | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# homebrew install
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
    (echo; echo '# homebrew'; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/${USER_NAME}/.profile && \
    (echo; echo '# homebrew'; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/${USER_NAME}/.bashrc