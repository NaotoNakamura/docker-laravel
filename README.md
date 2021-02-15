# 環境構築手順

## リポジトリのクローン

```sh
$ git clone https://github.com/NaotoNakamura/docker-laravel.git
```

## コンテナ起動

```sh
$ docker-compose up -d --build
```

## appコンテナにアクセスし、Laravelをインストールする

```sh
$ docker-compose exec app bash
# composer create-project --prefer-dist "laravel/laravel=8.*" .
# composer install
# cp .env.example .env
# php artisan key:generate
```

## ``backend/.env`` のDB接続設定を修正

``infra/mysql/Dockerfile``の情報を参照

## DBとユーザー作成

```sh
$ docker-compose exec db bash
# create database DB名;
# CREATE USER 'ユーザー名'@'%' IDENTIFIED BY 'パスワード';
# GRANT ALL PRIVILEGES ON `DB名`.* TO `ユーザー名`@`%`;
```

## マイグレーション実行

```sh
$ docker-compose exec app bash
$ php artisan migrate
```

## localhost表示
http://localhost:10080/

## コンテナ終了

```sh
$ docker-compose down
```
