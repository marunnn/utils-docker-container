# **java-of-bind-mount**
# 概要
Javaの開発環境をDockerコンテナで作成する。(バインドマウントあり)  
※Javaのバージョンはコンテナ作成時に指定する。  
<br>
バインドマウント先
- ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/java-of-bind-mount
- コンテナ：/bind-mount  
<br><br>

# 前提条件
- 以下がインストール済みであること。
    - WSL2(Ubuntu)
    - Docker Engine
    - Docker Compose
- 作業の実施場所がLinux上であること。(/mnt/c配下ではないこと。)
<br><br>

# 使用手順
## リポジトリのクローン
```console
git clone https://github.com/marunnn/utils-docker-container.git
```
## ディレクトリ移動
```console
cd ./utils-docker-container/java-of-bind-mount/
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
docker compose exec -it java-of-bind-mount-container /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it java-of-bind-mount-container /bin/bash
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
※java-of-bind-mountディレクトリ配下で実行。
### 起動中コンテナの状態確認  
```console
docker compose ps
```
### コンテナの停止と削除  
```console
docker compose down
```
### コンテナの起動
```console
docker compose start
```
### コンテナの停止
```console
docker compose stop
```
## dockerコマンド
### コンテナの起動
```console
docker start java-of-bind-mount-container
```
### コンテナの停止
```console
docker stop java-of-bind-mount-container
```
