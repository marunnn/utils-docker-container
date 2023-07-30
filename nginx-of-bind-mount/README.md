# **nginx-of-bind-mount**
# 概要
nginxの開発環境をDockerコンテナで作成する。(バインドマウントあり)  
※nginxのバージョンはコンテナ作成時に指定する。  
<br>
バインドマウント先
- データディレクトリ  
※ドキュメントルートとして使用するディレクトリ。
    - ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/nginx-of-bind-mount/data
    - コンテナ：/data
- 作業ディレクトリ
    - ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/nginx-of-bind-mount/work
    - コンテナ：/${UNAME}/bind-mount  
    ※\${UNAME}は `set-env.sh` で任意に設定可。(デフォルトでは `root` )

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
cd ./utils-docker-container/nginx-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：nginxのバージョン(デフォルト：latest)  
※コンテナのイメージタグで使用するため、[こちら](https://hub.docker.com/_/nginx/tags)に記載のタグであれば何を引数に指定しても良い。

次は、nginx 1.25.1の開発環境を構築するときの例になる。
```console
sh ./set-env.sh 1.25.1
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
docker compose exec -it nginx-of-bind-mount /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it nginx-${VERSION}-of-bind-mount-container /bin/bash
```
※${VERSION}は `シェルスクリプト実行` で指定したnginxのバージョン。

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照。
