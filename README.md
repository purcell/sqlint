[![Build Status](https://github.com/purcell/sqlint/actions/workflows/ci.yml/badge.svg)](https://github.com/purcell/sqlint/actions/workflows/ci.yml)
[ ![](https://img.shields.io/gem/v/sqlint.svg)](https://rubygems.org/gems/sqlint)
[ ![](https://img.shields.io/gem/dt/sqlint.svg)](https://rubygems.org/gems/sqlint)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

## SQLint - a simple SQL linter

### About

SQLint is a simple command-line linter which reads your SQL files and
reports any syntax errors or warnings it finds.

At this stage, SQLint checks SQL against the ANSI syntax, and uses the
PostgreSQL SQL parser to achieve this. SQLint does not have support
for non-standard SQL variants (e.g. MySQL), but contributions are welcome.

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

In the absence of a filename, `sqlint` reads from standard input.

### Editor plugins

Support for `sqlint` is provided for the following editors:

- Emacs, via [Flycheck](https://github.com/flycheck/flycheck)
- VIM, via [Syntastic](https://github.com/scrooloose/syntastic), [Neomake](https://github.com/neomake/neomake) or [ALE](https://github.com/w0rp/ale)
- SublimeText, via [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter3/)


### Using with pre-commit

Add this to your `.pre-commit-hooks.yaml`:

```yaml
-   repo: https://github.com/purcell/sqlint
    rev: master
    hooks:
    -   id: sqlint
```

### Authors

This software was written by
[Steve Purcell](https://github.com/purcell) and
[Kieran Trezona-le Comte](https://github.com/trezona-lecomte).

### License and copyright

Copyright 2015-2018 Powershop NZ Ltd.
Copyright 2018-2021 Steve Purcell.
MIT license.

<hr>

[💝 Support this project and my other Open Source work via Patreon](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

[🐦 @sanityinc](https://twitter.com/sanityinc)
