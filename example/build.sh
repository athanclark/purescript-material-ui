#! /bin/bash

pulp build && \
    purs bundle output/**/*.js -m Main --main Main > index.js.tmp && \
    ./node_modules/.bin/browserify index.js.tmp > index.js && \
    rm index.js.tmp
