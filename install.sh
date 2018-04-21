#!/bin/bash

set -e

readlink() {
    if [ "$(uname)" == 'Darwin' ]; then
        # use coreutils
        command greadlink "$@"
    else
        command readlink "$@"
    fi
}

DIR=$(dirname $(readlink -f $0))
cd $DIR

# 既に patch 済みの場合の hunk を避けるバッドハックなのだけど、ベターな回避方法ないかな
rm -rf extlib/lib/perl5/MogileFS
./cpanm -L extlib --mirror=$(pwd)/cpan-mirror/ --mirror-only --installdeps . "$@"
