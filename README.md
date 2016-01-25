# Makefiles for Node.js packages

A suite of rules, to be used with [make](https://www.gnu.org/software/make/),
that are useful when developing [Node.js](https://nodejs.org/) packages.


## Install

```bash
$ npm install @jaredhanson/make-node --save-dev
```


## Usage

Include this suite of rules in a project's top-level Makefile

```make
include node_modules/@jaredhanson/make-node/main.mk
```

#### make test

A project's test suite can be run by executing:

```bash
make test
```

By default, the test suite will be run using [Mocha](https://mochajs.org/) as a
test framework.


## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2016 Jared Hanson <[http://jaredhanson.net/](http://jaredhanson.net/)>
