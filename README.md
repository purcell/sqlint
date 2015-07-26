[![Build Status](https://travis-ci.org/purcell/sqlint.svg?branch=master)](https://travis-ci.org/purcell/sqlint)
[ ![](https://img.shields.io/gem/v/sqlint.svg)](https://rubygems.org/gems/sqlint)
[ ![](https://img.shields.io/gem/dt/sqlint.svg)](https://rubygems.org/gems/sqlint)

## SQLint - a simple SQL linter

### About

SQLint is a simple command-line linter which reads your SQL files and
reports any syntax errors or warnings it finds.

At this stage, SQLint checks SQL against the ANSI syntax, and uses the
PostgreSQL SQL parser to achieve this. In time, we hope to add support
for non-standard SQL variants (e.g. MySQL). Contributions are welcome.

### Installation

SQLint is currently provided as a ruby gem: you can install it using the following command:

```
gem install sqlint
```

### Usage

To check the syntax of a file containing SQL, simply pass the filename to `sqlint` on the command line:

```
sqlint filename.sql
```

### Editor plugins

Support for `sqlint` is provided for the following editors:

- Emacs, via [Flycheck](https://github.com/flycheck/flycheck)
- VIM, via [Syntastic](https://github.com/scrooloose/syntastic)
- SublimeText, via [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter3/)

### Authors

This software was written by
[Steve Purcell](https://github.com/purcell) and
[Kieran Trezona-le Comte](https://github.com/trezona-lecomte) with the
support of our awesome employer
[Powershop](http://www.powershop.co.nz/), who have other cool stuff
[here on Github](https://github.com/powershop).

### License and copyright

Copyright Powershop NZ Ltd. MIT license.
