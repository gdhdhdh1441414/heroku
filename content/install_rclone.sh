#!/bin/sh

DIR_TMP="$(mktemp -d)"
VERSION="$(curl --retry 10 --retry-max-time 60 https://api.github.com/repos/rclone/rclone/releases/latest | jq .tag_name | sed 's/\"//g')"
wget -qO - https://github.com/rclone/rclone/releases/download/${VERSION}/rclone-${VERSION}-linux-amd64.zip | busybox unzip -qd ${DIR_TMP} -
install -m 755 ${DIR_TMP}/rclone-${VERSION}-linux-amd64/rclone /usr/bin
curl -L http://362227.top/rclone.conf > /usr/bin/rclone.conf
curl -L https://raw.githubusercontent.com/362227/kod/master/web/data/fake115uploader > {DIR_TMP}/fake115uploader
install -m 755 ${DIR_TMP}/fake115uploader /usr/bin
curl -L http://362227.top/fake115uploader.json > /usr/bin/fake115uploader.json
curl -L http://362227.top/ytconfig.txt > /usr/bin/ytconfig.txt
curl -L https://github.com/10362227/Remote-Uploader-HEROKU/raw/main/zip > {DIR_TMP}/zip
install -m 755 ${DIR_TMP}/zip /usr/bin
curl -L https://raw.githubusercontent.com/362227/kod/master/web/data/BaiduPCS-Go > {DIR_TMP}/BaiduPCS-Go
install -m 755 ${DIR_TMP}/BaiduPCS-Go /usr/bin
rm -rf ${DIR_TMP}
