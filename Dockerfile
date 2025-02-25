ARG ARCH=x86-64
ARG VERSION=24.10.0
FROM docker.io/openwrt/sdk:$ARCH-$VERSION

RUN echo 'src-git openhybrid https://github.com/NKnusperer/openhybrid-openwrt.git;master' >> feeds.conf.default \
    && ./scripts/feeds update base packages openhybrid busybox-openhybrid \
    && make defconfig \
    && ./scripts/feeds install openhybrid busybox-openhybrid libmnl \
    && make package/openhybrid/compile \
    && make package/busybox-openhybrid/compile