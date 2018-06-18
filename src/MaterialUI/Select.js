"use strict";

var Select = require('material-ui/Select').default;
var withStyles = require('material-ui/styles').withStyles;

exports.selectImpl = Select;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
