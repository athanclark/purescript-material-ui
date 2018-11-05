"use strict";

var Form = require('@material-ui/core/Form');
var withStyles = require('@material-ui/core/styles').withStyles;

exports.formControlLabelImpl = Form.FormControlLabel;
exports.formControlImpl = Form.FormControl;
exports.formGroupImpl = Form.FormGroup;
exports.formLabelImpl = Form.FormLabel;

exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
