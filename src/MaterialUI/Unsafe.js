"use strict";

exports.unsafeApplyProps = function unsafeApplyProps (p) {
  if (!p.web) {
    return p;
  }
  var r = {};
  Object.assign(r, p, p.web);
  delete r.web;
  return r;
};
