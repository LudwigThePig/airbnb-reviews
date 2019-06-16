"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _react = _interopRequireDefault(require("react"));

var _styledComponents = _interopRequireDefault(require("styled-components"));

var _reviewsModalBody = _interopRequireDefault(require("./reviewsModalBody"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _templateObject2() {
  var data = _taggedTemplateLiteral(["\n  &&& { \n    width: 30px;\n    height: 30px;\n    border-radius: 50%;\n    box-shadow: ", ";\n  }\n"]);

  _templateObject2 = function _templateObject2() {
    return data;
  };

  return data;
}

function _templateObject() {
  var data = _taggedTemplateLiteral(["\n  &&& { \n    display: ", ";\n  }\n"]);

  _templateObject = function _templateObject() {
    return data;
  };

  return data;
}

function _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }

var ModalInner = _styledComponents["default"].div(_templateObject(), function (props) {
  return props.isModalShowing ? "table-cell" : "none";
});

var SvgBox = _styledComponents["default"].div(_templateObject2(), function (props) {
  return props.isModalSelected ? "0 .1rem .5rem rgba(118,118,118,0)" : "0 .1rem .5rem rgba(118,118,118,0.5)";
});

var ReviewModal = function ReviewModal(_ref) {
  var isModalShowing = _ref.isModalShowing,
      isModalSelected = _ref.isModalSelected,
      selectModal = _ref.selectModal,
      reviews = _ref.reviews,
      formatDate = _ref.formatDate,
      toggleModal = _ref.toggleModal;
  return _react["default"].createElement("div", {
    className: "Reviews"
  }, _react["default"].createElement("div", {
    id: "rModal"
  }, _react["default"].createElement(ModalInner, {
    isModalShowing: isModalShowing,
    onClick: function onClick() {
      return selectModal();
    }
  }, _react["default"].createElement("div", {
    className: "rModalInner"
  }, _react["default"].createElement("div", {
    className: "rModalHeader"
  }, _react["default"].createElement("button", {
    id: "closeButton",
    className: "rCloseButton",
    onClick: function onClick() {
      return toggleModal();
    }
  }, _react["default"].createElement(SvgBox, {
    isModalSelected: isModalSelected
  }, _react["default"].createElement("svg", {
    className: "rSvgButton",
    viewBox: " 0 0 24 24"
  }, _react["default"].createElement("path", {
    d: "m23.25 24c-.19 0-.38-.07-.53-.22l-10.72-10.72-10.72 10.72c-.29.29-.77.29-1.06 0s-.29-.77 0-1.06l10.72-10.72-10.72-10.72c-.29-.29-.29-.77 0-1.06s.77-.29 1.06 0l10.72 10.72 10.72-10.72c.29-.29.77-.29 1.06 0s .29.77 0 1.06l-10.72 10.72 10.72 10.72c.29.29.29.77 0 1.06-.15.15-.34.22-.53.22"
  }))))), _react["default"].createElement("div", {
    className: "rModalBody"
  }, _react["default"].createElement(_reviewsModalBody["default"], {
    reviews: reviews,
    formatDate: formatDate
  }))))));
};

var _default = ReviewModal;
exports["default"] = _default;