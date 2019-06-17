"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _react = _interopRequireDefault(require("react"));

var _moment = _interopRequireDefault(require("moment"));

var _axios = _interopRequireDefault(require("axios"));

var _styledComponents = _interopRequireDefault(require("styled-components"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }

var App =
/*#__PURE__*/
function (_React$Component) {
  _inherits(App, _React$Component);

  function App(props) {
    var _this;

    _classCallCheck(this, App);

    _this = _possibleConstructorReturn(this, _getPrototypeOf(App).call(this, props));
    _this.state = {
      reviews: [],
      isModalShowing: false,
      isModalSelected: false
    };
    _this.toggleModal = _this.toggleModal.bind(_assertThisInitialized(_this));
    _this.selectModal = _this.selectModal.bind(_assertThisInitialized(_this));
    return _this;
  }

  _createClass(App, [{
    key: "toggleModal",
    value: function toggleModal() {
      this.setState({
        isModalShowing: !this.state.isModalShowing,
        isModalSelected: false
      });
    }
  }, {
    key: "selectModal",
    value: function selectModal() {
      this.setState({
        isModalSelected: true
      });
    }
  }, {
    key: "formatDate",
    value: function formatDate(date) {
      return (0, _moment["default"])(new Date(date)).fromNow().toString();
    }
  }, {
    key: "sortByDate",
    value: function sortByDate(reviews) {
      return reviews.sort(function (a, b) {
        return new Date(b.date) - new Date(a.date);
      });
    }
  }, {
    key: "componentDidMount",
    value: function componentDidMount() {
      var _this2 = this;

      (0, _axios["default"])({
        url: "http://".concat(document.location.hostname, ":3004/api/listings/reviews/").concat(Math.floor(Math.random() * 999999 / 2) + 499980),
        method: 'GET',
        headers: {
          'Accepts': 'application/json',
          'Content-Type': 'application/json'
        }
      }).then(function (res) {
        return res.data;
      }).then(function (data) {
        _this2.setState(function (state) {
          data = _this2.sortByDate(data);
          return {
            reviews: data
          };
        });
      })["catch"](console.error);
    }
  }, {
    key: "render",
    value: function render() {
      return _react["default"].createElement("div", {
        className: "Reviews"
      }, _react["default"].createElement("div", {
        id: "rApp"
      }, _react["default"].createElement("div", {
        className: "rBodyContainer"
      }, _react["default"].createElement("div", {
        className: "rModalContainer"
      }, _react["default"].createElement("p", null, "Bob is your uncle!")), _react["default"].createElement("hr", null))));
    }
  }]);

  return App;
}(_react["default"].Component);

var _default = App;
exports["default"] = _default;