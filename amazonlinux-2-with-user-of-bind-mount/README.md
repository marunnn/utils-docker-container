# **amazonlinux-2-with-user-of-bind-mount**
# 概要
Amazon Linux 2の環境をDockerコンテナで作成する。(バインドマウントあり。)  
※試験など、新規のAmazon Linux 2環境が必要なときに使用する目的。
## バインドマウント先
- ホスト： `utils-docker-container/amazonlinux-2-with-user-of-bind-mount/bind-mount`
- コンテナ： `/home/${USER_NAME}/bind-mount`  
  ※ `${USER_NAME}` は任意に設定可。(以下の"使用手順 > 変数の設定"を参照。)

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
cd ./utils-docker-container/amazonlinux-2-with-user-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：Dockerfileで生成するimageタグ(デフォルト： `latest` )  
- 第2引数：コンテナのユーザ名(デフォルト： `user` )
- 第3引数：コンテナのユーザパスワード(デフォルト： `user` )

次はDockerfileで生成するimageタグが `v01` 、ユーザとパスワードが `ec2-user` の開発環境を構築するときの例になる。
```console
sh ./set-env.sh v01 ec2-user ec2-user
```
## Dockerコンテナの使用
[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)に記載されている下記の項目を実施する。
- serviceコマンド > Dockerの起動
- docker composeコマンド > コンテナの作成と起動
- docker composeコマンド > コンテナに入る  
  ※"dockerコマンド > コンテナに入る"でも良い。

# 備考
その他、Dockerで使用する基本的なコマンドについては、[こちらの"備考 > Dockerで使用する基本的なコマンド"](../README.md)を参照する。