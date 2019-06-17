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

/***/ "./babelDist/App.js":
/*!**************************!*\
  !*** ./babelDist/App.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n  value: true\n});\nexports[\"default\"] = void 0;\n\nvar _react = _interopRequireDefault(__webpack_require__(/*! react */ \"react\"));\n\nvar _moment = _interopRequireDefault(__webpack_require__(/*! moment */ \"moment\"));\n\nvar _axios = _interopRequireDefault(__webpack_require__(/*! axios */ \"axios\"));\n\nvar _styledComponents = _interopRequireDefault(__webpack_require__(/*! styled-components */ \"styled-components\"));\n\nvar _reviews = _interopRequireDefault(__webpack_require__(/*! ./reviews */ \"./babelDist/reviews.js\"));\n\nvar _reviewModal = _interopRequireDefault(__webpack_require__(/*! ./reviewModal */ \"./babelDist/reviewModal.js\"));\n\nfunction _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { \"default\": obj }; }\n\nfunction _typeof(obj) { if (typeof Symbol === \"function\" && typeof Symbol.iterator === \"symbol\") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === \"function\" && obj.constructor === Symbol && obj !== Symbol.prototype ? \"symbol\" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === \"object\" || typeof call === \"function\")) { return call; } return _assertThisInitialized(self); }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError(\"this hasn't been initialised - super() hasn't been called\"); } return self; }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== \"function\" && superClass !== null) { throw new TypeError(\"Super expression must either be null or a function\"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\nfunction _templateObject() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& {\\n    opacity: \", \";\\n  }\\n\"]);\n\n  _templateObject = function _templateObject() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }\n\n// import styles from '../main.scss';\nvar ModalProp = _styledComponents[\"default\"].div(_templateObject(), function (props) {\n  return props.isModalShowing ? \"0.5\" : \"1.0\";\n});\n\nvar App =\n/*#__PURE__*/\nfunction (_React$Component) {\n  _inherits(App, _React$Component);\n\n  function App(props) {\n    var _this;\n\n    _classCallCheck(this, App);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(App).call(this, props));\n    _this.state = {\n      reviews: [],\n      isModalShowing: false,\n      isModalSelected: false\n    };\n    _this.toggleModal = _this.toggleModal.bind(_assertThisInitialized(_this));\n    _this.selectModal = _this.selectModal.bind(_assertThisInitialized(_this));\n    return _this;\n  }\n\n  _createClass(App, [{\n    key: \"toggleModal\",\n    value: function toggleModal() {\n      this.setState({\n        isModalShowing: !this.state.isModalShowing,\n        isModalSelected: false\n      });\n    }\n  }, {\n    key: \"selectModal\",\n    value: function selectModal() {\n      this.setState({\n        isModalSelected: true\n      });\n    }\n  }, {\n    key: \"formatDate\",\n    value: function formatDate(date) {\n      return (0, _moment[\"default\"])(new Date(date)).fromNow().toString();\n    }\n  }, {\n    key: \"sortByDate\",\n    value: function sortByDate(reviews) {\n      return reviews.sort(function (a, b) {\n        return new Date(b.date) - new Date(a.date);\n      });\n    }\n  }, {\n    key: \"componentDidMount\",\n    value: function componentDidMount() {\n      var _this2 = this;\n\n      (0, _axios[\"default\"])({\n        url: \"http://\".concat(document.location.hostname, \":3004/api/listings/reviews/\").concat(Math.floor(Math.random() * 999999 / 2) + 499980),\n        method: 'GET',\n        headers: {\n          'Accepts': 'application/json',\n          'Content-Type': 'application/json'\n        }\n      }).then(function (res) {\n        return res.data;\n      }).then(function (data) {\n        _this2.setState(function (state) {\n          data = _this2.sortByDate(data);\n          return {\n            reviews: data\n          };\n        });\n      })[\"catch\"](console.error);\n    }\n  }, {\n    key: \"render\",\n    value: function render() {\n      var _this3 = this;\n\n      return _react[\"default\"].createElement(\"div\", {\n        className: \"Reviews\"\n      }, _react[\"default\"].createElement(\"div\", {\n        id: \"rApp\"\n      }, _react[\"default\"].createElement(\"div\", {\n        className: \"rBodyContainer\"\n      }, _react[\"default\"].createElement(\"div\", {\n        className: \"rModalContainer\"\n      }, _react[\"default\"].createElement(_reviewModal[\"default\"], {\n        id: \"modal\",\n        isModalShowing: this.state.isModalShowing,\n        isModalSelected: this.state.isModalSelected,\n        selectModal: this.selectModal,\n        toggleModal: this.toggleModal,\n        reviews: this.state.reviews,\n        formatDate: this.formatDate\n      }), _react[\"default\"].createElement(\"p\", null, \"Bob is your uncle!\")), _react[\"default\"].createElement(\"div\", {\n        className: \"rPageContainer\",\n        onClick: function onClick() {\n          return _this3.toggleModal();\n        }\n      }, _react[\"default\"].createElement(ModalProp, {\n        isModalShowing: this.state.isModalShowing\n      }, _react[\"default\"].createElement(\"hr\", null), _react[\"default\"].createElement(\"div\", {\n        className: \"rPaddingTop\"\n      }, _react[\"default\"].createElement(\"h1\", {\n        className: \"rReviewTitle\"\n      }, \"Reviews\"), _react[\"default\"].createElement(_reviews[\"default\"], {\n        isModalShowing: this.state.isModalShowing,\n        toggleModal: this.toggleModal,\n        reviews: this.state.reviews,\n        formatDate: this.formatDate\n      }), _react[\"default\"].createElement(\"div\", {\n        className: \"rModalButtonContainer\"\n      }, _react[\"default\"].createElement(\"a\", {\n        className: \"rMoreReviews\",\n        id: \"moreReviews\",\n        style: {\n          'color': '#914669'\n        },\n        onClick: this.toggleModal\n      }, \"Read all \", this.state.reviews.length, \" reviews\"))))), _react[\"default\"].createElement(\"hr\", null))));\n    }\n  }]);\n\n  return App;\n}(_react[\"default\"].Component);\n\nvar _default = App;\nexports[\"default\"] = _default;\n\n//# sourceURL=webpack:///./babelDist/App.js?");

/***/ }),

/***/ "./babelDist/review.js":
/*!*****************************!*\
  !*** ./babelDist/review.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n  value: true\n});\nexports[\"default\"] = void 0;\n\nvar _react = _interopRequireDefault(__webpack_require__(/*! react */ \"react\"));\n\nfunction _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { \"default\": obj }; }\n\nvar Review = function Review(_ref) {\n  var review = _ref.review,\n      formatDate = _ref.formatDate;\n  return _react[\"default\"].createElement(\"div\", {\n    className: \"Reviews\"\n  }, _react[\"default\"].createElement(\"div\", {\n    id: \"rReview\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rReviewBox\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rReviewBox\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rViewBox\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rImageBox\"\n  }, _react[\"default\"].createElement(\"img\", {\n    className: \"rCustomImage reviewPhoto\",\n    src: review.photo,\n    alt: \"\"\n  }))), _react[\"default\"].createElement(\"div\", {\n    className: \"rViewBox\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rReviewDate reviewDate\"\n  }, formatDate(review.date)))), _react[\"default\"].createElement(\"div\", {\n    className: \"rFlexBox\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rReviewText reviewText\"\n  }, review.text)))));\n};\n\nvar _default = Review;\nexports[\"default\"] = _default;\n\n//# sourceURL=webpack:///./babelDist/review.js?");

/***/ }),

/***/ "./babelDist/reviewModal.js":
/*!**********************************!*\
  !*** ./babelDist/reviewModal.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n  value: true\n});\nexports[\"default\"] = void 0;\n\nvar _react = _interopRequireDefault(__webpack_require__(/*! react */ \"react\"));\n\nvar _styledComponents = _interopRequireDefault(__webpack_require__(/*! styled-components */ \"styled-components\"));\n\nvar _reviewsModalBody = _interopRequireDefault(__webpack_require__(/*! ./reviewsModalBody */ \"./babelDist/reviewsModalBody.js\"));\n\nfunction _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { \"default\": obj }; }\n\nfunction _templateObject2() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& { \\n    width: 30px;\\n    height: 30px;\\n    border-radius: 50%;\\n    box-shadow: \", \";\\n  }\\n\"]);\n\n  _templateObject2 = function _templateObject2() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _templateObject() {\n  var data = _taggedTemplateLiteral([\"\\n  &&& { \\n    display: \", \";\\n  }\\n\"]);\n\n  _templateObject = function _templateObject() {\n    return data;\n  };\n\n  return data;\n}\n\nfunction _taggedTemplateLiteral(strings, raw) { if (!raw) { raw = strings.slice(0); } return Object.freeze(Object.defineProperties(strings, { raw: { value: Object.freeze(raw) } })); }\n\nvar ModalInner = _styledComponents[\"default\"].div(_templateObject(), function (props) {\n  return props.isModalShowing ? \"table-cell\" : \"none\";\n});\n\nvar SvgBox = _styledComponents[\"default\"].div(_templateObject2(), function (props) {\n  return props.isModalSelected ? \"0 .1rem .5rem rgba(118,118,118,0)\" : \"0 .1rem .5rem rgba(118,118,118,0.5)\";\n});\n\nvar ReviewModal = function ReviewModal(_ref) {\n  var isModalShowing = _ref.isModalShowing,\n      isModalSelected = _ref.isModalSelected,\n      selectModal = _ref.selectModal,\n      reviews = _ref.reviews,\n      formatDate = _ref.formatDate,\n      toggleModal = _ref.toggleModal;\n  return _react[\"default\"].createElement(\"div\", {\n    className: \"Reviews\"\n  }, _react[\"default\"].createElement(\"div\", {\n    id: \"rModal\"\n  }, _react[\"default\"].createElement(ModalInner, {\n    isModalShowing: isModalShowing,\n    onClick: function onClick() {\n      return selectModal();\n    }\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rModalInner\"\n  }, _react[\"default\"].createElement(\"div\", {\n    className: \"rModalHeader\"\n  }, _react[\"default\"].createElement(\"button\", {\n    id: \"closeButton\",\n    className: \"rCloseButton\",\n    onClick: function onClick() {\n      return toggleModal();\n    }\n  }, _react[\"default\"].createElement(SvgBox, {\n    isModalSelected: isModalSelected\n  }, _react[\"default\"].createElement(\"svg\", {\n    className: \"rSvgButton\",\n    viewBox: \" 0 0 24 24\"\n  }, _react[\"default\"].createElement(\"path\", {\n    d: \"m23.25 24c-.19 0-.38-.07-.53-.22l-10.72-10.72-10.72 10.72c-.29.29-.77.29-1.06 0s-.29-.77 0-1.06l10.72-10.72-10.72-10.72c-.29-.29-.29-.77 0-1.06s.77-.29 1.06 0l10.72 10.72 10.72-10.72c.29-.29.77-.29 1.06 0s .29.77 0 1.06l-10.72 10.72 10.72 10.72c.29.29.29.77 0 1.06-.15.15-.34.22-.53.22\"\n  }))))), _react[\"default\"].createElement(\"div\", {\n    className: \"rModalBody\"\n  }, _react[\"default\"].createElement(_reviewsModalBody[\"default\"], {\n    reviews: reviews,\n    formatDate: formatDate\n  }))))));\n};\n\nvar _default = ReviewModal;\nexports[\"default\"] = _default;\n\n//# sourceURL=webpack:///./babelDist/reviewModal.js?");

/***/ }),

/***/ "./babelDist/reviews.js":
/*!******************************!*\
  !*** ./babelDist/reviews.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n  value: true\n});\nexports[\"default\"] = void 0;\n\nvar _react = _interopRequireDefault(__webpack_require__(/*! react */ \"react\"));\n\nvar _review = _interopRequireDefault(__webpack_require__(/*! ./review */ \"./babelDist/review.js\"));\n\nfunction _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { \"default\": obj }; }\n\nvar Reviews = function Reviews(_ref) {\n  var reviews = _ref.reviews,\n      formatDate = _ref.formatDate;\n  var groups = [reviews.slice(0, 2), reviews.slice(2, 4), reviews.slice(4, 6)];\n  return _react[\"default\"].createElement(\"div\", {\n    className: \"Reviews\"\n  }, _react[\"default\"].createElement(\"div\", {\n    id: \"rReviews\"\n  }, groups.map(function (group, k) {\n    return _react[\"default\"].createElement(\"div\", {\n      className: \"row\",\n      key: k\n    }, group.map(function (review, i) {\n      return _react[\"default\"].createElement(\"div\", {\n        className: \"rReviewColumn\",\n        key: i + k\n      }, _react[\"default\"].createElement(_review[\"default\"], {\n        review: review,\n        formatDate: formatDate\n      }));\n    }));\n  })));\n};\n\nvar _default = Reviews;\nexports[\"default\"] = _default;\n\n//# sourceURL=webpack:///./babelDist/reviews.js?");

/***/ }),

/***/ "./babelDist/reviewsModalBody.js":
/*!***************************************!*\
  !*** ./babelDist/reviewsModalBody.js ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n  value: true\n});\nexports[\"default\"] = void 0;\n\nvar _react = _interopRequireDefault(__webpack_require__(/*! react */ \"react\"));\n\nfunction _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { \"default\": obj }; }\n\nvar ReviewsModalBody = function ReviewsModalBody(_ref) {\n  var reviews = _ref.reviews,\n      formatDate = _ref.formatDate;\n  return _react[\"default\"].createElement(\"div\", {\n    className: \"Reviews\"\n  }, _react[\"default\"].createElement(\"div\", {\n    id: \"rModalBody\"\n  }, _react[\"default\"].createElement(\"h1\", {\n    className: \"rReviewsHeader\"\n  }, reviews.length, \" Reviews\"), reviews.map(function (review, i) {\n    return _react[\"default\"].createElement(\"div\", {\n      key: i\n    }, _react[\"default\"].createElement(\"div\", {\n      className: \"rReviewBox\"\n    }, _react[\"default\"].createElement(\"div\", {\n      className: \"rViewBox\"\n    }, _react[\"default\"].createElement(\"div\", {\n      className: \"rImageBox\"\n    }, _react[\"default\"].createElement(\"img\", {\n      src: review.photo,\n      alt: \"\",\n      className: \"rCustomImage\"\n    }))), _react[\"default\"].createElement(\"div\", {\n      className: \"rViewBox\"\n    }, _react[\"default\"].createElement(\"span\", {\n      className: \"rReviewName\"\n    }, review.user), _react[\"default\"].createElement(\"div\", {\n      className: \"rReviewDate\"\n    }, formatDate(review.date)))), _react[\"default\"].createElement(\"div\", {\n      id: \"modalText\",\n      className: \"rReviewText\"\n    }, review.text), _react[\"default\"].createElement(\"hr\", null));\n  })));\n};\n\nvar _default = ReviewsModalBody;\nexports[\"default\"] = _default;\n\n//# sourceURL=webpack:///./babelDist/reviewsModalBody.js?");

/***/ }),

/***/ "./server/app.js":
/*!***********************!*\
  !*** ./server/app.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Imports\n__webpack_require__(/*! dotenv */ \"dotenv\").config()\n// require('newrelic');\nconst database = __webpack_require__(/*! ./dbrouter.js */ \"./server/dbrouter.js\");\nconst express = __webpack_require__(/*! express */ \"express\");\nconst bodyParser = __webpack_require__(/*! body-parser */ \"body-parser\");\nconst cors = __webpack_require__(/*! cors */ \"cors\");\n\n// Crazy SSR stuff\nconst React = __webpack_require__(/*! react */ \"react\");\nconst ReactDOMServer = __webpack_require__(/*! react-dom/server */ \"react-dom/server\");\nconst TranspiledApp = __webpack_require__(/*! ../babelDist/App.js */ \"./babelDist/App.js\").default;\n// const RawApp = React.createFactory(require('../client/components/App.jsx'));\n\n// Configuration\nconst app = express();\n// Middleware\napp.use(express.static('public'));\napp.use(bodyParser.json());\napp.use(cors());\n\n\n// More crazy SSR stuff\napp.get('/ssr', (req, res) => {\n  const html = ReactDOMServer.renderToStaticMarkup(TranspiledApp);\n  console.log(html);\n  console.log(React.isValidElement(TranspiledApp))\n  res.send(html);\n});\n\n// Routes\napp.get('/api/listings/reviews/:id', (req, res) => {\n  let listing_id = req.params.id;\n  console.log('we made it!')\n  database.getReviews(listing_id, (err, data) => {\n    if (err) {\n      res.status(400)\n        .json({message: err});\n      return;\n    }\n    res.json(data);\n  });\n});\n\nmodule.exports = app;\n\n\n//# sourceURL=webpack:///./server/app.js?");

/***/ }),

/***/ "./server/db/index.js":
/*!****************************!*\
  !*** ./server/db/index.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("/* eslint-disable no-console */\nconst { Pool } = __webpack_require__(/*! pg */ \"pg\");\n\nconst pool =  false\n  ? undefined\n  : new Pool({\n    user: 'postgres',\n    host: 'localhost',\n    database: 'airbnb_reviews',\n    password: 'rei',\n    port: '5432',\n  });\n\nconst getReviews = (id, db, cb) => {\n  const queryString = `SELECT * FROM reviews LIMIT 15 OFFSET ${Number(id)};`;\n  pool.query(queryString, (err, result) => {\n    if (err) {\n      console.log(err);\n      return cb(err, null);\n    }\n    return cb(null, result.rows);\n  });\n};\n\nmodule.exports = {\n  pool,\n  getReviews,\n}\n\n//# sourceURL=webpack:///./server/db/index.js?");

/***/ }),

/***/ "./server/dbrouter.js":
/*!****************************!*\
  !*** ./server/dbrouter.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const mongo = __webpack_require__(/*! ./mongo/index.js */ \"./server/mongo/index.js\");\nconst postgres = __webpack_require__(/*! ./db/index.js */ \"./server/db/index.js\")\n\nlet databaseChoice;\nif (process.env.DB === 'MONGO') {\n  databaseChoice = mongo;\n} else {\n  databaseChoice = postgres;\n}\n\nmodule.exports = databaseChoice;\n\n//# sourceURL=webpack:///./server/dbrouter.js?");

/***/ }),

/***/ "./server/mongo/index.js":
/*!*******************************!*\
  !*** ./server/mongo/index.js ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const getReviews = (id, cb) => {\n  const db = global.db.db('airbnb_reviews');\n\n  const startQuery = new Date();\n\n  db.collection('reviews').find({ listing_id: Number(id) }).limit(15).toArray((err, documents) => {\n    const endQuery = new Date();\n    \n    if (err) {\n      return console.log(err)\n    }\n    console.log('query time ', endQuery - startQuery, 'ms');\n    return cb(null, documents);\n  });\n};\n\nmodule.exports = {\n  getReviews,\n}\n\n//# sourceURL=webpack:///./server/mongo/index.js?");

/***/ }),

/***/ "./server/server.js":
/*!**************************!*\
  !*** ./server/server.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const app = __webpack_require__(/*! ./app.js */ \"./server/app.js\");\nconst port = 3004;\nconst MongoClient = __webpack_require__(/*! mongodb */ \"mongodb\").MongoClient;\nconst url = process.env.MONGO_CONNECTION || 'mongodb://localhost:27017/airbnb_reviews';\n\n// Server Setup\nif (process.env.DB === 'MONGO') {\n  MongoClient.connect(url, { useNewUrlParser: true }, (err, db) => {\n    if (err) {\n      return console.error(err);\n    }\n    global.db = db;\n    app.listen(port, () => {\n      console.log(`Listening on localhost:${port} with Mongo in ${\"development\"} mode`);\n    });\n  });\n} else {\n  app.listen(port, () => {\n    console.log(`Listening on localhost:${port} with Mongo in ${\"development\"} mode`);\n  });\n}\n\n//# sourceURL=webpack:///./server/server.js?");

/***/ }),

/***/ 0:
/*!********************************!*\
  !*** multi ./server/server.js ***!
  \********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__(/*! ./server/server.js */\"./server/server.js\");\n\n\n//# sourceURL=webpack:///multi_./server/server.js?");

/***/ }),

/***/ "axios":
/*!************************!*\
  !*** external "axios" ***!
  \************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"axios\");\n\n//# sourceURL=webpack:///external_%22axios%22?");

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

/***/ "moment":
/*!*************************!*\
  !*** external "moment" ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"moment\");\n\n//# sourceURL=webpack:///external_%22moment%22?");

/***/ }),

/***/ "mongodb":
/*!**************************!*\
  !*** external "mongodb" ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = require(\"mongodb\");\n\n//# sourceURL=webpack:///external_%22mongodb%22?");

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