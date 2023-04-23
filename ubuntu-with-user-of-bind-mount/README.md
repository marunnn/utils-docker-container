# **ubuntu-with-user-of-bind-mount**
# 概要
WSL2(Ubuntu)と同等の環境をDockerコンテナで作成する。(バインドマウントあり)  
※試験など、新規のLinux(Ubuntu)環境が必要なときに使用する目的。  
<br>
バインドマウント先
- ホスト：${リポジトリをクローンするディレクトリ}/bind-mount/ubuntu-with-user-of-bind-mount
- コンテナ：/home/${UNAME}/bind-mount  
  ※\${UNAME}は任意に設定可。(以下の"使用手順 > 変数の設定"を参照。)
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
cd ./utils-docker-container/ubuntu-with-user-of-bind-mount/
```
## 変数の設定
### 権限の変更
```console
chmod 744 ./set-env.sh
```
### シェルスクリプト実行
引数により以下の設定ができる。(特に気にしない場合は引数なしで実行する。)
- 第1引数：コンテナのユーザ名とグループ名(デフォルト：user)
- 第2引数：コンテナのユーザパスワード(デフォルト：user)
```console
sh ./set-env.sh
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
docker compose exec -it ubuntu-with-user-of-bind-mount /bin/bash
```
### dockerコマンドを使用
```console
docker exec -it ubuntu-with-user-of-bind-mount-container /bin/bash
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
※ubuntu-with-user-of-bind-mountディレクトリ配下で実行。
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
docker start ubuntu-with-user-of-bind-mount-container
```
### コンテナの停止
```console
docker stop ubuntu-with-user-of-bind-mount-container
```
