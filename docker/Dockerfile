# syntax = docker/dockerfile:experimental

FROM python:3.10-slim-bullseye as builder

RUN apt-get update && apt-get install -y gcc curl \
    zlib1g-dev libjpeg-dev libjpeg62-turbo-dev 
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && apt-get install --reinstall libc6-dev -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN mkdir -p /tmp/.cargo && \
    ln -s /tmp/.cargo /root/.cargo && \
    chmod 777 /root/.cargo && \
    pip install --upgrade pip && pip install -r https://github.com/Soulter/QQChannelChatGPT/raw/master/requirements.txt


FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install -y \
    coreutils \
    tzdata && \
    echo "**** create abc user and make our folders ****" && \
    groupmod -g 1000 users && \
    useradd -u 911 -U -s /bin/false -m -d /app abc && \
    usermod -G users abc && \
    rm -rf /var/lib/apt/lists/*

# Copy pre-built packages from builder stage
COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
# Now install packages as normal — tiktoken will already be installed and skipped if present in requirements.txt
RUN python -m pip install --upgrade pip && \
    pip install -r https://github.com/Soulter/QQChannelChatGPT/raw/master/requirements.txt

VOLUME /app

ENV TZ=Asia/Shanghai

ENV PUID=1000
ENV PGID=1000

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
