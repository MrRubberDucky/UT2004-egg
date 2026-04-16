FROM    public.ecr.aws/docker/library/debian:trixie-slim

LABEL   org.opencontainers.image.source="https://github.com/mrrubberducky/yolks"
LABEL   org.opencontainers.image.licenses=MIT

ENV     DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
        ca-certificates coreutils bash \
        7zip unzip curl wget tar jq wget bzip2 \
        libc6:i386 lib32gcc-s1 libsdl2-2.0-0:i386 \
    && curl -SL -o ./libstdc.deb https://web.archive.org/web/20260416130619/https://ftp.debian.org/debian/pool/main/g/gcc-3.3/libstdc++5_3.3.6-34_i386.deb \
    && dpkg -i libstdc.deb \
    && rm libstdc.deb
