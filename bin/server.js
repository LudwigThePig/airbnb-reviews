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

/***/ "./server/app.js":
/*!***********************!*\
  !*** ./server/app.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Imports\n__webpack_require__(/*! dotenv */ \"dotenv\").config()\n// require('newrelic');\nconst database = __webpack_require__(/*! ./dbrouter.js */ \"./server/dbrouter.js\");\nconst express = __webpack_require__(/*! express */ \"express\");\nconst bodyParser = __webpack_require__(/*! body-parser */ \"body-parser\");\nconst cors = __webpack_require__(/*! cors */ \"cors\");\nconst fs = __webpack_require__(/*! fs */ \"fs\");\n\n// Crazy SSR stuff\nconst React = __webpack_require__(/*! react */ \"react\");\n// const ReactDOMServer = require('react-dom/server');\n// const TranspiledApp = require('../babelDist/App.js').default;\n// const RawApp = React.createFactory(require('../client/components/App.jsx'));\n// const renderer = require('./renderer.js')\n\n// Configuration\nconst app = express();\n// Middleware\napp.use(express.static('public'));\napp.use(bodyParser.json());\napp.use(cors());\n\n\n// More crazy SSR stuff\napp.get('/ssr', (req, res) => {\n  // const html = ReactDOMServer.renderToStaticMarkup(TranspiledApp);\n  // console.log(html);\n  // console.log(React.isValidElement(TranspiledApp))\n  fs.readFile('../public/index.html', 'utf-8', (err, data) => {\n    if(err) {\n      res.status(400).send(err);\n    }\n  });\n  res.send(html);\n});\n\n// Routes\napp.get('/api/listings/reviews/:id', (req, res) => {\n  let listing_id = req.params.id;\n  console.log('we made it!')\n  database.getReviews(listing_id, (err, data) => {\n    if (err) {\n      res.status(400)\n        .json({message: err});\n      return;\n    }\n    res.json(data);\n  });\n});\n\nmodule.exports = app;\n\n\n//# sourceURL=webpack:///./server/app.js?");

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

/***/ })

/******/ });