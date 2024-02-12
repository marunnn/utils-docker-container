# **nginx-of-bind-mount**
# 概要
nginxの開発環境をDockerコンテナで作成する。(バインドマウントあり。)  
※nginxのバージョンはコンテナ作成時に指定する。
## バインドマウント先
- データディレクトリ  
  ※ドキュメントルートとして使用するディレクトリ。
    - ホスト： `utils-docker-container/nginx-of-bind-mount/bind-mount/data`
    - コンテナ： `/data`
- 作業ディレクトリ
    - ホスト： `utils-docker-container/nginx-of-bind-mount/bind-mount/work`
    - コンテナ： `/root/bind-mount`

# 前提条件
- 以下がインストール済みであること。
    - WSL 2(Ubuntu)
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
- 第1引数：nginxのバージョン(デフォルト： `1.25.3` )  
  ※コンテナのイメージタグで使用するため、[Docker Hub](https://hub.docker.com/)に記載のタグであれば何を引数に指定しても良い。

次はnginx 1.25.1の開発環境を構築するときの例になる。
```console
sh ./set-env.sh 1.25.1
```
## Dockerコンテナの使用
[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)に記載されている下記の項目を実施する。
- serviceコマンド > Dockerの起動
- docker composeコマンド > コンテナの作成と起動
- docker composeコマンド > コンテナに入る  
  ※"dockerコマンド > コンテナに入る"でも良い。

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照する。