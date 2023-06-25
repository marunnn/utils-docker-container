# **utils-docker-container**
# 概要
開発環境で使用できる便利なDockerコンテナを作成する。

# 前提条件

# 使用手順
## WSL2(Ubuntu)のインストール

## Docker Engine / Docker Composeのインストール

# 備考
## Dockerで使用する基本的なコマンド
### serviceコマンド
#### Dockerの状態確認
```console
service docker status
```
結果例
```console
$ service docker status
 * Docker is running
```
#### Dockerを起動
```console
sudo service docker start
```
#### Dockerを停止
```console
sudo service docker stop
```
### docker composeコマンド
※対象のcompose.yamlがあるディレクトリ配下で実行。
#### 起動中コンテナの状態確認  
```console
docker compose ps
```
#### コンテナの作成と起動
```console
docker compose up -d
```
#### コンテナの停止と削除  
```console
docker compose down
```
#### コンテナの起動
```console
docker compose start
```
#### コンテナの停止
```console
docker compose stop
```
#### コンテナに入る
```console
docker compose exec -it ${コンテナのNAME} /bin/bash
```
### dockerコマンド
#### 起動中コンテナの状態確認  
```console
docker ps
```
#### 全コンテナの状態確認  
```console
docker ps -a
```
#### コンテナの起動
```console
docker start ${コンテナのNAME}
```
#### コンテナの停止
```console
docker stop ${コンテナのNAME}
```
#### コンテナに入る
```console
docker exec -it ${コンテナのNAME} /bin/bash
```
