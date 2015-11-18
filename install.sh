#!/bin/sh

set -e

if [ -L $0 ]; then
    DIR=$(dirname $(readlink -f $0))
else
    DIR=$(dirname $0)
fi

cd $DIR
./cpanm -L extlib --mirror=$(pwd)/cpan-mirror/ --mirror-only --installdeps . "$@"

