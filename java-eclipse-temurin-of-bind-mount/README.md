# **java-eclipse-temurin-of-bind-mount**
# 概要
Java(eclipse-temurin)の開発環境をDockerコンテナで作成する。(バインドマウントあり)  
※Javaのバージョンはコンテナ作成時に指定する。  
<br>
バインドマウント先
- ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/java-eclipse-temurin-of-bind-mount
- コンテナ：/bind-mount  

# 前提条件
- 以下がインストール済みであること。
    - WSL2(Ubuntu)
    - Docker Engine
    - Docker Compose
- 作業の実施場所がLinux上であること。(/mnt/c配下ではないこと。)

# 使用手順
## リポジトリのクローン
```console
git clone https://github.com/marunnn/utils-docker-container.git
```
## ディレクトリ移動
```console
cd ./utils-docker-container/java-eclipse-temurin-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：Javaのバージョン(デフォルト：latest)  
※コンテナのイメージタグで使用するため、[こちら](https://hub.docker.com/_/eclipse-temurin/tags)に記載のタグであれば何を引数に指定しても良い。

次は、Java 11の開発環境を構築するときの例になる。
```console
sh ./set-env.sh 11
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
docker compose exec -it java-eclipse-temurin-of-bind-mount /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it java-eclipse-temurin-of-bind-mount-container /bin/bash
```

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照。
