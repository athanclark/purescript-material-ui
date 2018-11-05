"use strict";

var Chip = require('@material-ui/core/Chip').default;
var withStyles = require('@material-ui/core/styles').withStyles;

exports.chipImpl = Chip;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
