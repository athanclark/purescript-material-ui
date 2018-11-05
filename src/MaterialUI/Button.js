"use strict";

var Button = require('@material-ui/core/Button').default;
var withStyles = require('@material-ui/core/styles').withStyles;

exports.buttonImpl = Button;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  return withStyles(stylesF)(x);
};
