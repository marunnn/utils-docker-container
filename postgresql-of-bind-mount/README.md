# **postgresql-of-bind-mount**
# 概要
PostgreSQLの開発環境をDockerコンテナで作成する。(バインドマウントあり)  
※PostgreSQLのバージョンはコンテナ作成時に指定する。  
<br>
バインドマウント先
- 初期化スクリプトディレクトリ  
※コンテナ起動時に`.sql`ファイルや`.sh`ファイルを実行する。(アルファベット順に実行？)  
　データディレクトリが空の状態でコンテナを起動した場合にのみ実行される。(詳細：[リンク先の"Initialization scripts"](https://hub.docker.com/_/postgres))
    - ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/postgresql-of-bind-mount/init
    - コンテナ：/docker-entrypoint-initdb.d
- データディレクトリ  
※DBデータを格納しているディレクトリ。(データ永続化用のディレクトリ。)
    - ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/postgresql-of-bind-mount/data
    - コンテナ：/var/lib/postgresql/data
- 作業ディレクトリ
    - ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/postgresql-of-bind-mount/work
    - コンテナ：/bind-mount-work

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
cd ./utils-docker-container/postgresql-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：PostgreSQLのバージョン(デフォルト：latest)  
※コンテナのイメージタグで使用するため、[こちら](https://hub.docker.com/_/postgres)に記載のタグであれば何を引数に指定しても良い。
- 第2引数：PostgreSQLのユーザとパスワード(デフォルト：sample)
- 第3引数：作成されるデフォルトのDB(デフォルト：sample)

次は、PostgreSQL 15.3のユーザとパスワードがtest、デフォルトDBがdefaultの開発環境を構築するときの例になる。
```console
sh ./set-env.sh 15.3 test dafault
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
docker compose exec -it postgresql-of-bind-mount-container /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it postgresql-of-bind-mount-container /bin/bash
```

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照。
