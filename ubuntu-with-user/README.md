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
<br><br>

# 使用手順
## リポジトリのクローン
```console
git clone https://github.com/marunnn/utils-docker-container.git
```
## ディレクトリ移動
```console
cd ./utils-docker-container/ubuntu-with-user/
```
## Dockerを起動
```console
sudo service docker start
```
## コンテナの作成と起動
```console
docker compose up -d
```
## コンテナに入る
### docker composeコマンドを使用
```console
docker compose exec -it ubuntu-with-user /bin/bash
```
結果例
```console
$ docker compose exec -it ubuntu-with-user /bin/bash
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

user@hoge:~$
```
<br>

### dockerコマンドを使用
```console
docker exec -it ubuntu-with-user-container /bin/bash
```
結果例
```console
$ docker exec -it ubuntu-with-user-container /bin/bash
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

user@hoge:~$
```
<br><br>

# 備考
## Dockerの状態確認
```console
service docker status
```
結果例
```console
$ service docker status
 * Docker is running
```
## Dockerを停止
```console
sudo service docker stop
```
## docker composeコマンド
※ubuntu-with-userディレクトリ配下で実行。
### 起動中コンテナの状態確認  
```console
docker compose ps
```
結果例
```console
$ docker compose ps
NAME                         IMAGE                     COMMAND             SERVICE             CREATED             STATUS              PORTS
ubuntu-with-user-container   ubuntu-with-user:latest   "/bin/bash"         ubuntu-with-user    11 minutes ago      Up 11 minutes
```
<br>

### コンテナの停止と削除  
```console
docker compose down
```
<br>

### コンテナの起動
```console
docker compose start
```
<br>

### コンテナの停止
```console
docker compose stop
```
## dockerコマンド
### Dockerfileのビルド
```console
docker build -t ubuntu-with-user .
```
※上記の使用手順では、コンテナの起動時にcompose.yaml内でビルドしている。  
<br>

### コンテナの起動
```console
docker start ubuntu-with-user-container
```
<br>

### コンテナの停止
```console
docker stop ubuntu-with-user-container
```
