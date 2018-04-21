p5-bundle-mogilefs ![Docker Automated build](https://img.shields.io/docker/automated/pepabo/mogilefs.svg?style=flat-square) ![Docker Build Status](https://img.shields.io/docker/build/pepabo/mogilefs.svg?style=flat-square)
==================

[mogilefs](https://github.com/mogilefs)全部入り

How to update cpan modules
---

### 1. Download a module to cpam-mirror directory

```sh
wget http://search.cpan.org/CPAN/authors/id/<P>/<PA>/<PATH>/<PATH TO module> -P cpan-mirror/authors/id/<P>/<PA>/<PATH>/

# Remove old version module if needed
unlink cpan-mirror/authors/id/<P>/<PA>/<PATH>/<PATH TO module>
```

### 2. Make index of orepan

```sh
./cpanm -Lextlib Module::Install
./cpanm -Lextlib OrePAN
perl -Iextlib/lib/perl5 extlib/bin/orepan_index.pl --repository=cpan-mirror/
```

### 3. commit

```sh
# If you need to change MogileFS modules, update Makefile.PL to bump up version.
vim Makefile.PL

git add .
```
