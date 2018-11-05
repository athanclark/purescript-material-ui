"use strict";

var Select = require('@material-ui/core/Select').default;
var withStyles = require('@material-ui/core/styles').withStyles;

exports.selectImpl = Select;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
