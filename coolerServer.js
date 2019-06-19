/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./client/components/DumbApp.jsx":
/*!***************************************!*\
  !*** ./client/components/DumbApp.jsx ***!
  \***************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _reviews__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./reviews */ \"./client/components/reviews.jsx\");\n/* harmony import */ var _reviewModal__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./reviewModal */ \"./client/components/reviewModal.jsx\");\n/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! styled-components */ \"styled-components\");\n/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(styled_components__WEBPACK_IMPORTED_MODULE_3__);\nfunction _typeof(obj) { if (typeof Symbol === \"function\" && typeof Symbol.iterator === \"symbol\") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === \"function\" && obj.constructor === Symbol && obj !== Symbol.prototype ? \"symbol\" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === \"object\" || typeof call === \"function\")) { return call; } return _assertThisInitialized(self); }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError(\"this hasn't been initialised - super() hasn't been called\"); } return self; }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== \"function\" && superClass !== null) { throw new TypeError(\"Super expression must either be null or a function\"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\nfunction _templateObject() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& {\\n    opacity: \", \";\\n  }\\n\"]);\n\n  _templateObject = function _templateObject() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }\n\n\n\n\n\nvar ModalProp = styled_components__WEBPACK_IMPORTED_MODULE_3___default.a.div(_templateObject(), function (props) {\n  return props.isModalShowing ? \"0.5\" : \"1.0\";\n});\n\nvar App =\n/*#__PURE__*/\nfunction (_React$Component) {\n  _inherits(App, _React$Component);\n\n  _createClass(App, null, [{\n    key: \"formatDate\",\n    value: function formatDate(date) {\n      date = date.split('-');\n      var now = new Date();\n      var nowFormated = [now.getFullYear(), now.getMonth(), now.getDay()];\n      date = date.map(function (item, i) {\n        return nowFormated[i] - item;\n      });\n\n      if (date[0] > 1) {\n        return \"\".concat(date[0], \" years ago\");\n      } else if (date[0] === 1) {\n        return 'a year ago';\n      } else if (date[0] > 0) {\n        return \"\".concat(date[1], \" months ago\");\n      } else {\n        return 'recently';\n      }\n    }\n  }]);\n\n  function App(props) {\n    var _this;\n\n    _classCallCheck(this, App);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(App).call(this, props));\n    _this.state = {\n      reviews: _this.props.data,\n      isModalShowing: false,\n      isModalSelected: false\n    };\n    _this.toggleModal = _this.toggleModal.bind(_assertThisInitialized(_this));\n    _this.selectModal = _this.selectModal.bind(_assertThisInitialized(_this));\n    return _this;\n  }\n\n  _createClass(App, [{\n    key: \"toggleModal\",\n    value: function toggleModal() {\n      this.setState({\n        isModalShowing: !this.state.isModalShowing,\n        isModalSelected: false\n      });\n    }\n  }, {\n    key: \"selectModal\",\n    value: function selectModal() {\n      this.setState({\n        isModalSelected: true\n      });\n    }\n  }, {\n    key: \"render\",\n    value: function render() {\n      return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"Reviews\"\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        id: \"rApp\"\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"rBodyContainer\"\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"rPageContainer\",\n        onClick: this.toggleModal\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(ModalProp, {\n        isModalShowing: this.state.isModalShowing\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"hr\", null), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"rPaddingTop\"\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"h1\", {\n        className: \"rReviewTitle\"\n      }, \"Reviews\"), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(_reviews__WEBPACK_IMPORTED_MODULE_1__[\"default\"], {\n        isModalShowing: this.state.isModalShowing,\n        toggleModal: this.toggleModal,\n        reviews: this.state.reviews,\n        formatDate: App.formatDate\n      }), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"rModalButtonContainer\"\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"a\", {\n        className: \"rMoreReviews\",\n        id: \"moreReviews\",\n        style: {\n          'color': '#914669'\n        },\n        onClick: this.toggleModal\n      }, \"Read all \", this.state.reviews.length, \" reviews\"))))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"hr\", null))));\n    }\n  }]);\n\n  return App;\n}(react__WEBPACK_IMPORTED_MODULE_0___default.a.Component);\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (App);\n\n//# sourceURL=webpack:///./client/components/DumbApp.jsx?");

/***/ }),

/***/ "./client/components/review.jsx":
/*!**************************************!*\
  !*** ./client/components/review.jsx ***!
  \**************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n\n\nvar Review = function Review(_ref) {\n  var review = _ref.review,\n      formatDate = _ref.formatDate;\n  return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"Reviews\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    id: \"rReview\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rReviewBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rReviewBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rViewBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rImageBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"img\", {\n    className: \"rCustomImage reviewPhoto\",\n    src: review.photo,\n    alt: \"\"\n  }))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rViewBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"span\", {\n    className: \"rReviewName reviewUser\"\n  }, review.guest), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rReviewDate reviewDate\"\n  }, formatDate(review.date)))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rFlexBox\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rReviewText reviewText\"\n  }, review.text)))));\n};\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (Review);\n\n//# sourceURL=webpack:///./client/components/review.jsx?");

/***/ }),

/***/ "./client/components/reviewModal.jsx":
/*!*******************************************!*\
  !*** ./client/components/reviewModal.jsx ***!
  \*******************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! styled-components */ \"styled-components\");\n/* harmony import */ var styled_components__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(styled_components__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _reviewsModalBody__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./reviewsModalBody */ \"./client/components/reviewsModalBody.jsx\");\nfunction _templateObject2() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& { \\n    width: 30px;\\n    height: 30px;\\n    border-radius: 50%;\\n    box-shadow: \", \";\\n  }\\n\"]);\n\n  _templateObject2 = function _templateObject2() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _templateObject() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& { \\n    display: \", \";\\n  }\\n\"]);\n\n  _templateObject = function _templateObject() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }\n\n\n\n\nvar ModalInner = styled_components__WEBPACK_IMPORTED_MODULE_1___default.a.div(_templateObject(), function (props) {\n  return props.isModalShowing ? \"table-cell\" : \"none\";\n});\nvar SvgBox = styled_components__WEBPACK_IMPORTED_MODULE_1___default.a.div(_templateObject2(), function (props) {\n  return props.isModalSelected ? \"0 .1rem .5rem rgba(118,118,118,0)\" : \"0 .1rem .5rem rgba(118,118,118,0.5)\";\n});\n\nvar ReviewModal = function ReviewModal(_ref) {\n  var isModalShowing = _ref.isModalShowing,\n      isModalSelected = _ref.isModalSelected,\n      selectModal = _ref.selectModal,\n      reviews = _ref.reviews,\n      formatDate = _ref.formatDate,\n      toggleModal = _ref.toggleModal;\n  return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"Reviews\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    id: \"rModal\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(ModalInner, {\n    isModalShowing: isModalShowing,\n    onClick: selectModal\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rModalInner\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rModalHeader\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"button\", {\n    id: \"closeButton\",\n    className: \"rCloseButton\",\n    onClick: toggleModal\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(SvgBox, {\n    isModalSelected: isModalSelected\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"svg\", {\n    className: \"rSvgButton\",\n    viewBox: \" 0 0 24 24\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"path\", {\n    d: \"m23.25 24c-.19 0-.38-.07-.53-.22l-10.72-10.72-10.72 10.72c-.29.29-.77.29-1.06 0s-.29-.77 0-1.06l10.72-10.72-10.72-10.72c-.29-.29-.29-.77 0-1.06s.77-.29 1.06 0l10.72 10.72 10.72-10.72c.29-.29.77-.29 1.06 0s .29.77 0 1.06l-10.72 10.72 10.72 10.72c.29.29.29.77 0 1.06-.15.15-.34.22-.53.22\"\n  }))))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"rModalBody\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(_reviewsModalBody__WEBPACK_IMPORTED_MODULE_2__[\"default\"], {\n    reviews: reviews,\n    formatDate: formatDate\n  }))))));\n};\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (ReviewModal);\n\n//# sourceURL=webpack:///./client/components/reviewModal.jsx?");

/***/ }),

/***/ "./client/components/reviews.jsx":
/*!***************************************!*\
  !*** ./client/components/reviews.jsx ***!
  \***************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _review__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./review */ \"./client/components/review.jsx\");\n\n\n\nvar Reviews = function Reviews(_ref) {\n  var reviews = _ref.reviews,\n      formatDate = _ref.formatDate;\n  var groups = [reviews.slice(0, 2), reviews.slice(2, 4), reviews.slice(4, 6)];\n  return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"Reviews\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    id: \"rReviews\"\n  }, groups.map(function (group, k) {\n    return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"row\",\n      key: k\n    }, group.map(function (review, i) {\n      return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n        className: \"rReviewColumn\",\n        key: i + k\n      }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(_review__WEBPACK_IMPORTED_MODULE_1__[\"default\"], {\n        review: review,\n        formatDate: formatDate\n      }));\n    }));\n  })));\n};\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (Reviews);\n\n//# sourceURL=webpack:///./client/components/reviews.jsx?");

/***/ }),

/***/ "./client/components/reviewsModalBody.jsx":
/*!************************************************!*\
  !*** ./client/components/reviewsModalBody.jsx ***!
  \************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n\n\nvar ReviewsModalBody = function ReviewsModalBody(_ref) {\n  var reviews = _ref.reviews,\n      formatDate = _ref.formatDate;\n  return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    className: \"Reviews\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n    id: \"rModalBody\"\n  }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"h1\", {\n    className: \"rReviewsHeader\"\n  }, reviews.length, \" Reviews\"), reviews.map(function (review, i) {\n    return react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      key: i\n    }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"rReviewBox\"\n    }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"rViewBox\"\n    }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"rImageBox\"\n    }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"img\", {\n      src: review.photo,\n      alt: \"\",\n      className: \"rCustomImage\"\n    }))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"rViewBox\"\n    }, react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"span\", {\n      className: \"rReviewName\"\n    }, review.user), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      className: \"rReviewDate\"\n    }, formatDate(review.date)))), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"div\", {\n      id: \"modalText\",\n      className: \"rReviewText\"\n    }, review.text), react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(\"hr\", null));\n  })));\n};\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (ReviewsModalBody);\n\n//# sourceURL=webpack:///./client/components/reviewsModalBody.jsx?");

/***/ }),

/***/ "./server/app.js":
/*!***********************!*\
  !*** ./server/app.js ***!
  \***********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _renderer__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./renderer */ \"./server/renderer.js\");\n// Imports\n__webpack_require__(/*! dotenv */ \"dotenv\").config();\n\n__webpack_require__(/*! newrelic */ \"newrelic\");\n\nvar database = __webpack_require__(/*! ./dbrouter.js */ \"./server/dbrouter.js\");\n\nvar express = __webpack_require__(/*! express */ \"express\");\n\nvar bodyParser = __webpack_require__(/*! body-parser */ \"body-parser\");\n\nvar cors = __webpack_require__(/*! cors */ \"cors\");\n\nvar fs = __webpack_require__(/*! fs */ \"fs\");\n\nvar port = 3004;\n\nvar MongoClient = __webpack_require__(/*! mongodb */ \"mongodb\").MongoClient;\n\nvar url = process.env.MONGO_CONNECTION || 'mongodb://localhost:27017/airbnb_reviews';\n\nvar path = __webpack_require__(/*! path */ \"path\"); // Crazy SSR stuff\n\n\n // Configuration\n\nvar app = express(); // Middleware\n\napp.use(express[\"static\"]('public'));\napp.use(bodyParser.json());\napp.use(cors()); // More crazy SSR stuff\n\napp.get('/proxy/:id', function (req, res) {\n  var listing = Math.floor(Number(req.params.id) / 10 || 900000);\n  var htmlPath = path.resolve('public', 'proxyString.html');\n  fs.readFile(htmlPath, 'utf-8', function (err, file) {\n    if (err) {\n      res.status(400).send(err);\n    }\n\n    database.getReviews(listing, function (err, data) {\n      if (err) {\n        res.status(400).json({\n          message: err\n        });\n        return;\n      }\n\n      var html = Object(_renderer__WEBPACK_IMPORTED_MODULE_0__[\"default\"])(file, data);\n      res.send(html);\n    });\n  });\n});\napp.get('/', function (req, res) {\n  fs.readFile('./public/coolerIndex.html', 'utf-8', function (err, file) {\n    if (err) {\n      res.status(400).send(err);\n    }\n\n    database.getReviews(23111, function (err, data) {\n      if (err) {\n        res.status(400).json({\n          message: err\n        });\n        return;\n      }\n\n      var html = Object(_renderer__WEBPACK_IMPORTED_MODULE_0__[\"default\"])(file, data);\n      res.send(html);\n    });\n  });\n}); // Routes\n\napp.get('/api/listings/reviews/:id', function (req, res) {\n  var listing_id = req.params.id;\n  database.getReviews(listing_id, function (err, data) {\n    if (err) {\n      res.status(400).json({\n        message: err\n      });\n      return;\n    }\n\n    res.json(data);\n  });\n});\nMongoClient.connect(url, {\n  useNewUrlParser: true\n}, function (err, db) {\n  if (err) {\n    return console.error(err);\n  }\n\n  global.db = db;\n  app.listen(port, function () {\n    console.log(\"Listening on localhost:\".concat(port, \" with Mongo in \").concat(\"development\", \" mode\"));\n  });\n});\n\n//# sourceURL=webpack:///./server/app.js?");

/***/ }),

/***/ "./server/db/index.js":
/*!****************************!*\
  !*** ./server/db/index.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("/* eslint-disable no-console */\nvar _require = __webpack_require__(/*! pg */ \"pg\"),\n    Pool = _require.Pool;\n\nvar pool =  false ? undefined : new Pool({\n  user: 'postgres',\n  host: 'localhost',\n  database: 'airbnb_reviews',\n  password: 'rei',\n  port: '5432'\n});\n\nvar getReviews = function getReviews(id, db, cb) {\n  var queryString = \"SELECT * FROM reviews LIMIT 15 OFFSET \".concat(Number(id), \";\");\n  pool.query(queryString, function (err, result) {\n    if (err) {\n      console.log(err);\n      return cb(err, null);\n    }\n\n    return cb(null, result.rows);\n  });\n};\n\nmodule.exports = {\n  pool: pool,\n  getReviews: getReviews\n};\n\n//# sourceURL=webpack:///./server/db/index.js?");

/***/ }),

/***/ "./server/dbrouter.js":
/*!****************************!*\
  !*** ./server/dbrouter.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("var mongo = __webpack_require__(/*! ./mongo/index.js */ \"./server/mongo/index.js\");\n\nvar postgres = __webpack_require__(/*! ./db/index.js */ \"./server/db/index.js\");\n\nvar databaseChoice;\n\nif (process.env.DB === 'MONGO') {\n  databaseChoice = mongo;\n} else {\n  databaseChoice = postgres;\n}\n\nmodule.exports = databaseChoice;\n\n//# sourceURL=webpack:///./server/dbrouter.js?");

/***/ }),

/***/ "./server/mongo/index.js":
/*!*******************************!*\
  !*** ./server/mongo/index.js ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var getReviews = function getReviews(id, cb) {\n  var db = global.db.db('airbnb_reviews');\n  var startQuery = new Date();\n  db.collection('reviews').find({\n    listing_id: Number(id)\n  }).limit(15).toArray(function (err, documents) {\n    var endQuery = new Date();\n\n    if (err) {\n      return console.log(err);\n    }\n\n    console.log('query time ', endQuery - startQuery, 'ms');\n    return cb(null, documents);\n  });\n};\n\nmodule.exports = {\n  getReviews: getReviews\n};\n\n//# sourceURL=webpack:///./server/mongo/index.js?");

/***/ }),

/***/ "./server/renderer.js":
/*!****************************!*\
  !*** ./server/renderer.js ***!
  \****************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return renderer; });\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"react\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var react_dom_server__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! react-dom/server */ \"react-dom/server\");\n/* harmony import */ var react_dom_server__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(react_dom_server__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _client_components_DumbApp_jsx__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../client/components/DumbApp.jsx */ \"./client/components/DumbApp.jsx\");\n\n\n\nfunction renderer(html, data) {\n  var serverHtml = react_dom_server__WEBPACK_IMPORTED_MODULE_1___default.a.renderToString(react__WEBPACK_IMPORTED_MODULE_0___default.a.createElement(_client_components_DumbApp_jsx__WEBPACK_IMPORTED_MODULE_2__[\"default\"], {\n    data: data\n  }));\n  var regex = /(<div id=\"reviews\">)(<\\/div>)/;\n  html = html.replace(regex, function (original, div1, div2) {\n    return div1 + serverHtml + div2;\n  });\n  return html;\n}\n\n//# sourceURL=webpack:///./server/renderer.js?");

/***/ }),

/***/ 0:
/*!*****************************!*\
  !*** multi ./server/app.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__(/*! ./server/app.js */\"./server/app.js\");\n\n\n//# sourceURL=webpack:///multi_./server/app.js?");

/***/ }),

/***/ "body-parser":
/*!******************************!*\
  !*** external "body-parser" ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"body-parser\");\n\n//# sourceURL=webpack:///external_%22body-parser%22?");

/***/ }),

/***/ "cors":
/*!***********************!*\
  !*** external "cors" ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"cors\");\n\n//# sourceURL=webpack:///external_%22cors%22?");

/***/ }),

/***/ "dotenv":
/*!*************************!*\
  !*** external "dotenv" ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"dotenv\");\n\n//# sourceURL=webpack:///external_%22dotenv%22?");

/***/ }),

/***/ "express":
/*!**************************!*\
  !*** external "express" ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"express\");\n\n//# sourceURL=webpack:///external_%22express%22?");

/***/ }),

/***/ "fs":
/*!*********************!*\
  !*** external "fs" ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"fs\");\n\n//# sourceURL=webpack:///external_%22fs%22?");

/***/ }),

/***/ "mongodb":
/*!**************************!*\
  !*** external "mongodb" ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"mongodb\");\n\n//# sourceURL=webpack:///external_%22mongodb%22?");

/***/ }),

/***/ "newrelic":
/*!***************************!*\
  !*** external "newrelic" ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"newrelic\");\n\n//# sourceURL=webpack:///external_%22newrelic%22?");

/***/ }),

/***/ "path":
/*!***********************!*\
  !*** external "path" ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"path\");\n\n//# sourceURL=webpack:///external_%22path%22?");

/***/ }),

/***/ "pg":
/*!*********************!*\
  !*** external "pg" ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"pg\");\n\n//# sourceURL=webpack:///external_%22pg%22?");

/***/ }),

/***/ "react":
/*!************************!*\
  !*** external "react" ***!
  \************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"react\");\n\n//# sourceURL=webpack:///external_%22react%22?");

/***/ }),

/***/ "react-dom/server":
/*!***********************************!*\
  !*** external "react-dom/server" ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"react-dom/server\");\n\n//# sourceURL=webpack:///external_%22react-dom/server%22?");

/***/ }),

/***/ "styled-components":
/*!************************************!*\
  !*** external "styled-components" ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"styled-components\");\n\n//# sourceURL=webpack:///external_%22styled-components%22?");

/***/ })

/******/ });