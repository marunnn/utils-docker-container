# **ubuntu-with-user**
# 概要
WSL(Ubuntu)と同等の環境をDockerコンテナで作成する。  
※試験など、新規のLinux(Ubuntu)環境が必要なときに使用する目的。
<br><br>

# 前提条件
- 以下がインストール済みであること。
    - WSL(Ubuntu)
    - Docker Engine
    - Docker Compose
- 本リポジトリをクローン済みであること。
<br><br>

# 手順
Dockerを起動
```console
sudo service docker start
```
Dockerが起動中であることを確認
```console
service docker status
```
```console
$ service docker status  
 * Docker is running
```
ディレクトリ移動
```console
cd ${任意のディレクトリ}/git-docker/ubuntu-with-user/
```
Dockerfileのビルド
```console
docker build -t ubuntu-with-user .
```
コンテナの起動
```console
docker compose up -d
```
コンテナが起動中であることを確認
```console
docker compose ps
```
```console
$ docker compose ps
NAME                        IMAGE                     COMMAND             SERVICE             CREATED             STATUS              PORTS
ubuntu-ubuntu-with-user-1   ubuntu-with-user:latest   "/bin/bash"         ubuntu-with-user    6 seconds ago       Up 5 seconds
```
コンテナに入る
```console
docker compose exec -it ubuntu-with-user /bin/bash
```
```console
$ docker compose exec -it ubuntu-with-user /bin/bash
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

user@hoge:~$
```
