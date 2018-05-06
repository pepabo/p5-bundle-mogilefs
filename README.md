p5-bundle-mogilefs [![Travis](https://img.shields.io/travis/pepabo/p5-bundle-mogilefs.svg?style=flat-square)](https://travis-ci.org/pepabo/p5-bundle-mogilefs)[![Docker Automated build](https://img.shields.io/docker/automated/pepabo/mogilefs.svg?style=flat-square)](https://hub.docker.com/r/pepabo/mogilefs/~/dockerfile/)[![Docker Build Status](https://img.shields.io/docker/build/pepabo/mogilefs.svg?style=flat-square)](https://hub.docker.com/r/pepabo/mogilefs/builds/)
==================

[mogilefs](https://github.com/mogilefs)全部入り

How to update cpan modules
---

### 1. Install OrePAN2

```sh
./cpanm -Lextlib Module::Install OrePAN2
```

### 2. Download a module to cpam-mirror directory

```sh
perl -Iextlib/lib/perl5 extlib/bin/orepan2-inject http://cpan.metacpan.org/authors/id/<P>/<PA>/<PATH>/<PATH TO module> cpan-mirror/authors/id/<P>/<PA>/<PATH>/

# Remove old version module if needed
unlink cpan-mirror/authors/id/<P>/<PA>/<PATH>/<PATH TO module>
```

### 3. Make index

```sh
perl -Iextlib/lib/perl5 extlib/bin/orepan2-indexer cpan-mirror/
```

### 4. commit

```sh
# If you need to change MogileFS modules, update Makefile.PL to bump up version.
vim Makefile.PL

git add .
```
