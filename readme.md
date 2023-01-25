以下参考に
https://timesaving.hatenablog.com/entry/2022/10/03/150000

docker build -t poetry-fastapi-docker-image -f Dockerfile .

以下公式からインストールしようとしたけどうまくいかない。
https://python-poetry.org/docs/

こちらのコマンドでうまくいった。
curl --ssl https://install.python-poetry.org | python3

.zshrc にパスを通す処理を記述しておく。

# poetry

```
export PATH="/Users/takumi/.local/bin:$PATH"
```

Dcokerfile 内で指定している python のバージョンに注意する

```
FROM python:3.10-slim AS builder
```

## Docker image の作成

イメージの作成

```
docker build -t fastapi-sample -f Dockerfile .
docker build --no-cache -t fastapi-sample -f Dockerfile .
```

起動

```
docker container run -it -d -p 127.0.0.1:8080:80 --name fastapi-sample-container fastapi-sample
```

## イメージに入って確認

```
docker run -it 6d66fff6857a /bin/bash

docker exec -it 1 /bin/bash
```

## 削除系

イメージ削除
dangling=true フラグを使用して、タグやリポジトリがないイメージを検索し、それらのイメージ ID を取得し、それらを削除する

```
docker rmi $(docker images -f "dangling=true" -q)
```

コンテナー削除

```
docker container stop fastapi-sample-container
docker container rm fastapi-sample-container
docker rmi fastapi-sample

docker rm -f $(docker ps -a -q)
```

# docker compose

docker-compose down
docker-compose build --no-cache
docker-compose up -d

# 使用していない volumes を削除

```
docker volume prune -f
```
