"use strict";

var modules = require('material-ui/styles');

var MuiThemeProvider = modules.MuiThemeProvider;
var createMuiTheme = modules.createMuiTheme;


exports.muiThemeProviderImpl = MuiThemeProvider;

exports.defaultMuiTheme = createMuiTheme();

exports.createMuiThemeImpl = createMuiTheme;
