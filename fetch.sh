#!/bin/sh
VERSION=39.20231119.3.0
FILENAME=fedora-coreos-${VERSION}-live.x86_64.iso

if [ ! -f "${FILENAME}" ]; then
    curl -OL https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/${VERSION}/x86_64/${FILENAME}
fi

coreos-installer iso customize \
    --dest-device /dev/sda \
    --dest-ignition judy.ign \
    --dest-console ttyS0,115200n8 \
    --dest-console tty0 \
    --live-karg-append console=tty0 \
    --live-karg-append console=ttyS0,115200n8 \
    --dest-karg-append module_blacklist=pcengines_apuv2 \
    --live-karg-append module_blacklist=pcengines_apuv2 \
    -o custom.iso "${FILENAME}"
