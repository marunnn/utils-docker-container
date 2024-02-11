# **python-of-bind-mount**
# 概要
Pythonの開発環境をDockerコンテナで作成する。(バインドマウントあり。)  
※Pythonのバージョンはコンテナ作成時に指定する。
## バインドマウント先
- 作業ディレクトリ
    - ホスト： `utils-docker-container/python-of-bind-mount/bind-mount`
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
cd ./utils-docker-container/python-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：Pythonのバージョン(デフォルト： `3.12.2-slim-bullseye` )  
  ※コンテナのイメージタグで使用するため、[Docker Hub](https://hub.docker.com/)に記載のタグであれば何を引数に指定しても良い。

次は、Python 3.12.2-slim-bullseyeの開発環境を構築するときの例になる。
```console
sh ./set-env.sh 3.12.2-slim-bullseye
```
## Dockerコンテナの使用
[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)に記載されている下記の項目を実施する。
- serviceコマンド > Dockerの起動
- docker composeコマンド > コンテナの作成と起動
- docker composeコマンド > コンテナに入る  
  ※"dockerコマンド > コンテナに入る"でも良い。

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照する。