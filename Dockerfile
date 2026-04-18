FROM node:22-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      git \
      curl \
      wget \
      jq \
      openssl \
      ca-certificates \
      gnupg \
      bash \
      unzip \
      zip \
      tar \
      gzip \
      xz-utils \
      ripgrep \
      fd-find \
      procps \
      psmisc \
      lsof \
      net-tools \
      iputils-ping \
      dnsutils \
      less \
      nano \
      vim-tiny \
      sudo \
      tini \
      python3 \
      python3-pip \
      python3-venv \
      make \
      g++ \
      build-essential \
      pkg-config \
      sqlite3 \
      chromium \
      chromium-sandbox \
      fonts-liberation \
      fonts-noto-color-emoji \
      libnss3 \
      libatk-bridge2.0-0 \
      libdrm2 \
      libxkbcommon0 \
      libxcomposite1 \
      libxdamage1 \
      libxfixes3 \
      libxrandr2 \
      libgbm1 \
      libasound2 \
    && rm -rf /var/lib/apt/lists/*

ENV OPENCLAW_STATE_DIR=/data/.openclaw
ENV OPENCLAW_WORKSPACE_DIR=/data/workspace
ENV PATH="/usr/local/bin:${PATH}"

ENV ZAI_API_KEY=
ENV TELEGRAM_BOT_TOKEN=

RUN npm install -g openclaw@latest && \
    mkdir -p /data/.openclaw/agents/main/agent /data/workspace && \
    which openclaw

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18789

CMD ["/entrypoint.sh"]
