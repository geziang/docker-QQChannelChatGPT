FROM python:alpine

RUN apk add --no-cache git \
    coreutils \
    shadow \
    tzdata && \
    echo "**** create abc user and make our folders ****" && \
    groupmod -g 1000 users && \
    useradd -u 911 -U -s /bin/false -m -d /config abc && \
    usermod -G users abc

RUN python -m pip install --upgrade pip && \
    pip install -r https://github.com/Soulter/QQChannelChatGPT/raw/master/requirements.txt

VOLUME /app

ENV TZ=Asia/Shanghai

ENV PUID=1000
ENV PGID=1000

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
