"use strict";

var _react = _interopRequireDefault(require("react"));

var _enzyme = require("enzyme");

var _moment = _interopRequireDefault(require("moment"));

var _reviews = _interopRequireDefault(require("./reviews.jsx"));

var _review = _interopRequireDefault(require("./review.jsx"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

describe('Reviews', function () {
  it('format Date formats a date properly', function () {
    var wrapper = (0, _enzyme.shallow)(_react["default"].createElement(_review["default"], {
      review: {
        'date': '2019-05-03',
        'text': 'someting',
        'user': 'me',
        photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
      },
      formatDate: function formatDate(date) {
        return String((0, _moment["default"])(new Date(date)));
      }
    }));
    expect(wrapper.find('.reviewDate').text()).toEqual(String((0, _moment["default"])(new Date('2019-05-03'))));
  });
  it('displays text, user, and photo properly', function () {
    var wrapper = (0, _enzyme.shallow)(_react["default"].createElement(_review["default"], {
      review: {
        'date': '2019-05-03',
        'text': 'someting',
        'user': 'me',
        photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
      },
      formatDate: function formatDate(date) {
        return String((0, _moment["default"])(new Date(date)));
      }
    }));
    expect(wrapper.find('.reviewText').text()).toEqual('someting');
    expect(wrapper.find('.reviewUser').text()).toEqual('me');
    expect(wrapper.find('.reviewPhoto').prop('src')).toEqual('https://unsplash.com/photos/G6ntxf-QoSI');
  });
  it('renders all reviews', function () {
    var reviews = [{
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }, {
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }, {
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }, {
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }, {
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }, {
      'date': '2019-05-03',
      'text': 'someting',
      'user': 'me',
      photo: 'https://unsplash.com/photos/G6ntxf-QoSI'
    }];
    var wrapper = (0, _enzyme.mount)(_react["default"].createElement(_reviews["default"], {
      reviews: reviews,
      formatDate: function formatDate(date) {
        return String((0, _moment["default"])(new Date(date)));
      }
    }));
    expect(wrapper.find('.row').children().length).toEqual(6);
  });
});