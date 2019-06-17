"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _react = _interopRequireDefault(require("react"));

var _review = _interopRequireDefault(require("./review.js"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var Reviews = function Reviews(_ref) {
  var reviews = _ref.reviews,
      formatDate = _ref.formatDate;
  var groups = [reviews.slice(0, 2), reviews.slice(2, 4), reviews.slice(4, 6)];
  return _react["default"].createElement("div", {
    className: "Reviews"
  }, _react["default"].createElement("div", {
    id: "rReviews"
  }, groups.map(function (group, k) {
    return _react["default"].createElement("div", {
      className: "row",
      key: k
    }, group.map(function (review, i) {
      return _react["default"].createElement("div", {
        className: "rReviewColumn",
        key: i + k
      }, _react["default"].createElement(_review["default"], {
        review: review,
        formatDate: formatDate
      }));
    }));
  })));
};

var _default = Reviews;
exports["default"] = _default;