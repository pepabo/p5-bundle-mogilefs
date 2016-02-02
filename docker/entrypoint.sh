#!/bin/bash

DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"/..
ARCHNAME=$( perl -MConfig -e 'print $Config{archname}' )

export PERL5LIB=$DIR/extlib/lib/perl5:$DIR/extlib/lib/perl5/$ARCHNAME
export PERL5OPT="-Mlib=$DIR/extlib/lib/perl5"
export PATH="$DIR/extlib/bin:$PATH"

if [ "$#" -eq 0 ]; then
    set -- /bin/bash
fi

if [ "${1:0:1}" = '-' ]; then
    set -- mogilefsd "$@"
fi

if [ "$1" = mogilefsd ]; then
    if [ -z "$MOGILEFSD_DSN" ] && [ -n "$MOGILEFSD_DBTYPE$MOGILEFSD_DBNAME$MOGILEFSD_DBHOST$MOGILEFSD_DBPORT" ]; then
        dsn="DBI:${MOGILEFSD_DBTYPE:-mysql}:database=${MOGILEFSD_DBNAME:-mogilefs}"
        [ -n "$MOGILEFSD_DBHOST" ] && dsn="$dsn;host=$MOGILEFSD_DBHOST"
        [ -n "$MOGILEFSD_DBPORT" ] && dsn="$dsn;port=$MOGILEFSD_DBPORT"
        MOGILEFSD_DSN=$dsn
    fi

    [ -n "$MOGILEFSD_DSN" ] && set -- "$@" --dsn="$MOGILEFSD_DSN"
    [ -n "$MOGILEFSD_DBUSER" ] && set -- "$@" --dbuser="$MOGILEFSD_DBUSER"
    [ -n "$MOGILEFSD_DBPASS" ] && set -- "$@" --dbpass="$MOGILEFSD_DBPASS"
    set -- "$@" --user="${MOGILEFSD_USER:-root}"

    if [ -n "$MOGILEFSD_SETUP" ]; then
        setupopts=()
        [ -n "$MOGILEFSD_DBTYPE" ] && setupopts=("${setupopts[@]}" --type="$MOGILEFSD_DBTYPE")
        [ -n "$MOGILEFSD_DBHOST" ] && setupopts=("${setupopts[@]}" --dbhost="$MOGILEFSD_DBHOST")
        [ -n "$MOGILEFSD_DBPORT" ] && setupopts=("${setupopts[@]}" --dbport="$MOGILEFSD_DBPORT")
        [ -n "$MOGILEFSD_DBNAME" ] && setupopts=("${setupopts[@]}" --dbname="$MOGILEFSD_DBNAME")
        [ -n "$MOGILEFSD_DBROOTUSER" ] && setupopts=("${setupopts[@]}" --dbrootuser="$MOGILEFSD_DBROOTUSER")
        [ -n "$MOGILEFSD_DBROOTPASS" ] && setupopts=("${setupopts[@]}" --dbrootpass="$MOGILEFSD_DBROOTPASS")
        [ -n "$MOGILEFSD_DBUSER" ] && setupopts=("${setupopts[@]}" --dbuser="$MOGILEFSD_DBUSER")
        [ -n "$MOGILEFSD_DBPASS" ] && setupopts=("${setupopts[@]}" --dbpass="$MOGILEFSD_DBPASS")
        if ! mogdbsetup --yes "${setupopts[@]}"; then
            echo "mogdbsetup failed. Abort." >&2
            exit 1
        fi
    fi
fi

exec "$@"
