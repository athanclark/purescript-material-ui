"use strict";

var T = require('material-ui/Table');
var withStyles = require('material-ui/styles').withStyles;

exports.tableImpl = T.default;
exports.tableBodyImpl = T.TableBody;
exports.tableCellImpl = T.TableCell;
exports.tableHeadImpl = T.TableHead;
exports.tableRowImpl = T.TableRow;
exports.tableFooterImpl = T.TableFooter;
exports.tablePaginationImpl = T.TablePagination;
exports.tableSortLabelImpl = T.TableSortLabel;

exports.withStylesImpl = function withStylesImpl(stylesF,x) {
    return withStyles(stylesF)(x);
};
