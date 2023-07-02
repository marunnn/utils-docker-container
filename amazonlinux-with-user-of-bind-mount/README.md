# **amazonlinux-with-user-of-bind-mount**
# 概要
Amazon Linuxと同等の環境をDockerコンテナで作成する。(バインドマウントあり)  
※試験など、新規のAmazon Linux環境が必要なときに使用する目的。  
<br>
バインドマウント先
- ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/amazonlinux-with-user-of-bind-mount
- コンテナ：/home/${UNAME}/bind-mount  
  ※\${UNAME}は任意に設定可。(以下の"使用手順 > 変数の設定"を参照。)

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
cd ./utils-docker-container/amazonlinux-with-user-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：Amazon Linuxのバージョン(デフォルト：latest)  
※コンテナのイメージタグで使用するため、[こちら](https://hub.docker.com/_/amazonlinux)に記載のタグであれば何を引数に指定しても良い。
- 第2引数：コンテナのユーザ名(デフォルト：user)
- 第3引数：コンテナのユーザパスワード(デフォルト：user)

次は、Amazon Linux 2023のユーザとパスワードがec2-userの開発環境を構築するときの例になる。
```console
sh ./set-env.sh 2023 ec2-user ec2-user
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
docker compose exec -it amazonlinux-with-user-of-bind-mount-container /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it amazonlinux-with-user-of-bind-mount-container /bin/bash
```

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照。
