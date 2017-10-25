"use strict";

var Drawer = require('material-ui/Drawer').default;
var withStyles = require('material-ui/styles').withStyles;

exports.drawerImpl = Drawer;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  return withStyles(stylesF)(x);
};
