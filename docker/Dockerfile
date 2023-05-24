FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install -y \
    coreutils \
    tzdata && \
    echo "**** create abc user and make our folders ****" && \
    groupmod -g 1000 users && \
    useradd -u 911 -U -s /bin/false -m -d /app abc && \
    usermod -G users abc && \
    rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip && \
    pip install -r https://github.com/Soulter/QQChannelChatGPT/raw/master/requirements.txt

VOLUME /app

ENV TZ=Asia/Shanghai

ENV PUID=1000
ENV PGID=1000

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
