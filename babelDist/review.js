"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _react = _interopRequireDefault(require("react"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var Review = function Review(_ref) {
  var review = _ref.review,
      formatDate = _ref.formatDate;
  return _react["default"].createElement("div", {
    className: "Reviews"
  }, _react["default"].createElement("div", {
    id: "rReview"
  }, _react["default"].createElement("div", {
    className: "rReviewBox"
  }, _react["default"].createElement("div", {
    className: "rReviewBox"
  }, _react["default"].createElement("div", {
    className: "rViewBox"
  }, _react["default"].createElement("div", {
    className: "rImageBox"
  }, _react["default"].createElement("img", {
    className: "rCustomImage reviewPhoto",
    src: review.photo,
    alt: ""
  }))), _react["default"].createElement("div", {
    className: "rViewBox"
  }, _react["default"].createElement("div", {
    className: "rReviewDate reviewDate"
  }, formatDate(review.date)))), _react["default"].createElement("div", {
    className: "rFlexBox"
  }, _react["default"].createElement("div", {
    className: "rReviewText reviewText"
  }, review.text)))));
};

var _default = Review;
exports["default"] = _default;