# ベースイメージにUbuntuを指定
FROM ubuntu:22.04

# タイムゾーンの設定（日本時間に設定したい場合）
ENV TZ=Asia/Tokyo

# 必要なパッケージのインストール（Node.js含む）
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /src

# ポート開放（必要に応じて）
EXPOSE 3000

# コンテナ起動時のコマンド
CMD [ "/bin/bash" ]
