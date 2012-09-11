#!/bin/sh

set -e

DIR=$(dirname $(readlink -f $0))
cd $DIR
./cpanm -L extlib --mirror=$DIR/cpan-mirror/ --mirror-only --installdeps . "$@"

