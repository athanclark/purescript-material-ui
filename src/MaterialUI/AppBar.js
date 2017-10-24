"use strict";

var AppBar = require('material-ui/AppBar').default;
var withStyles = require('material-ui/styles').withStyles;

exports.appBarImpl = AppBar;
exports.withStylesImpl = function withStylesImpl(stylesF) {
  return function withStylesImpl2(Component) {
    return withStyles(stylesF)(Component);
  };
};
