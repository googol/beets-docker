FROM debian:buster-slim

RUN addgroup --system app --gid 150 && \
    adduser --system --ingroup app --shell /bin/bash --uid 1500 app && \
    mkdir -p /home/app/.config/beets && \
    mkdir -p /database && \
    mkdir -p /library && \
    mkdir -p /config && \
    touch "/config/config.yaml" && \
    apt-get update && \
    apt-get install -y \
        nodejs \
        python3 \
        python3-pip \
        python3-dev \
        git \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        libgstreamer1.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install \
        beets \
        requests \
        pylast

COPY beets.config.yaml /home/app/.config/beets/config.yaml
COPY index.js /home/app/

USER 1500:150

CMD ["node", "/home/app/index.js"]
