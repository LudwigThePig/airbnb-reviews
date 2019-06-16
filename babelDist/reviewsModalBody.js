"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _react = _interopRequireDefault(require("react"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var ReviewsModalBody = function ReviewsModalBody(_ref) {
  var reviews = _ref.reviews,
      formatDate = _ref.formatDate;
  return _react["default"].createElement("div", {
    className: "Reviews"
  }, _react["default"].createElement("div", {
    id: "rModalBody"
  }, _react["default"].createElement("h1", {
    className: "rReviewsHeader"
  }, reviews.length, " Reviews"), reviews.map(function (review, i) {
    return _react["default"].createElement("div", {
      key: i
    }, _react["default"].createElement("div", {
      className: "rReviewBox"
    }, _react["default"].createElement("div", {
      className: "rViewBox"
    }, _react["default"].createElement("div", {
      className: "rImageBox"
    }, _react["default"].createElement("img", {
      src: review.photo,
      alt: "",
      className: "rCustomImage"
    }))), _react["default"].createElement("div", {
      className: "rViewBox"
    }, _react["default"].createElement("span", {
      className: "rReviewName"
    }, review.user), _react["default"].createElement("div", {
      className: "rReviewDate"
    }, formatDate(review.date)))), _react["default"].createElement("div", {
      id: "modalText",
      className: "rReviewText"
    }, review.text), _react["default"].createElement("hr", null));
  })));
};

var _default = ReviewsModalBody;
exports["default"] = _default;