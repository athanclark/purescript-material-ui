"use strict";

var AppBar = require('material-ui/AppBar').default;
var withStyles = require('material-ui/styles').withStyles;

exports.appBarImpl = AppBar;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  console.log('...',x);
  return withStyles(stylesF)(x);
};
