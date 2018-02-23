"use strict";

var Button = require('material-ui/Button').default;
var withStyles = require('material-ui/styles').withStyles;

exports.buttonImpl = Button;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  return withStyles(stylesF)(x);
};
