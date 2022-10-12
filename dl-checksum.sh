#!/usr/bin/env bash
set -e
readonly DIR=~/Downloads
readonly MIRROR=https://github.com/knative/client/releases/download

# https://github.com/knative/client/releases/download/knative-v1.4.1/checksums.txt
# https://github.com/knative/client/releases/download/knative-v1.4.1/kn-linux-amd64

dl()
{
    local lchecksum=$1
    local ver=$2
    local os=$3
    local arch=$4
    local dotexe=${5:-""}
    local platform=${os}-${arch}
    local file=kn-${platform}${dotexe}
    local url=$MIRROR/knative-v${ver}/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksum | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    local checksum_url=${MIRROR}/knative-v${ver}/checksums.txt
    printf "  # %s\n" $checksum_url
    local lchecksum=$DIR/knative-v${ver}-checksums.txt

    if [ ! -e $lchecksum ];
    then
        curl -sSLf -o $lchecksum $checksum_url
    fi

    printf "  '%s':\n" $ver
    dl $lchecksum $ver darwin amd64
    dl $lchecksum $ver darwin arm64
    dl $lchecksum $ver linux amd64
    dl $lchecksum $ver linux arm64
    dl $lchecksum $ver linux ppc64le
    dl $lchecksum $ver linux s390x
    dl $lchecksum $ver windows amd64
}

dl_ver ${1:-1.7.1}
