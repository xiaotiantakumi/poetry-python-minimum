# はじめに

サーバーを起動

```
docker-compose up -d
```

起動中のコンテナーを確認

```
docker ps -a
```

中にはいる

```
docker exec -it "$container_id" /bin/bash
```

コンテナー内でファイル実行

```
python app.py
```

コンソールに Hello World と表示される

## poetry

pyproject.toml もディレクトリ共有されています。
初回はホスト側の pyproject.toml がコンテナーにコピーされます。(Dockerfile に COPY コマンドを書いているので確認してください。)
サーバーが起動されると、ホストとコンテナの変更がそれぞれに適応されます。
ホスト側の環境を汚さないためには、コンテナの中に入って poetry を使い必要なモジュールを追加してください。

# その他

Docker イメージとコンテナーの操作のチートシートとして使っているだけ。
このリポジトリーに直接関係はない。
