"use strict";

var Chip = require('material-ui/Chip').default;
var withStyles = require('material-ui/styles').withStyles;

exports.chipImpl = Chip;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
