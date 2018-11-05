"use strict";

var AppBar = require('@material-ui/core/AppBar').default;
var withStyles = require('@material-ui/core/styles').withStyles;

exports.appBarImpl = AppBar;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  return withStyles(stylesF)(x);
};
