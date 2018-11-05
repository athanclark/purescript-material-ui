"use strict";

var Drawer = require('@material-ui/core/Drawer').default;
var withStyles = require('@material-ui/core/styles').withStyles;

exports.drawerImpl = Drawer;
exports.withStylesImpl = function withStylesImpl(stylesF,x) {
  return withStyles(stylesF)(x);
};
