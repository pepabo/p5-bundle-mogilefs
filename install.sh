#!/bin/sh

set -e

DIR=$(dirname $(readlink -f $0))
cd $DIR
./cpanm -L extlib --mirror=$(pwd)/cpan-mirror/ --mirror-only --installdeps . "$@"

