"use strict";

var Modal = require('@material-ui/core/Modal').default;
var ModalManager = require('@material-ui/core/Modal').ModalManager;

exports.modalImpl = Modal;
exports.newModalManager = function (opts) {
    return new ModalManager(opts);
};
