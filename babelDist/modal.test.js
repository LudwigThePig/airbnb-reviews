"use strict";

var _react = _interopRequireDefault(require("react"));

var _enzyme = require("enzyme");

var _moment = _interopRequireDefault(require("moment"));

var _App = _interopRequireDefault(require("./App.js"));

var _reviewModal = _interopRequireDefault(require("./reviewModal.js"));

var _reviewsModalBody = _interopRequireDefault(require("./reviewsModalBody.js"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

describe('Modal', function () {
  it('modal renders on load', function () {
    var wrapper = (0, _enzyme.shallow)(_react["default"].createElement(_App["default"], {
      listing_id: 2
    }));
    expect(wrapper.find('#modal').length).toEqual(1);
  });
  it('displays modal when "isModalShowing" is true', function () {
    var modal = (0, _enzyme.shallow)(_react["default"].createElement(_reviewModal["default"], {
      isModalShowing: true
    }));
    expect(modal.exists()).toEqual(true);
  });
  it('renders text of modal when modal is open', function () {
    var wrapper = (0, _enzyme.mount)(_react["default"].createElement(_App["default"], {
      listing_id: 2
    }));
    var reviewsModalBody = (0, _enzyme.shallow)(_react["default"].createElement(_reviewsModalBody["default"], {
      reviews: [{
        'text': 'someting'
      }],
      formatDate: function formatDate(date) {
        return String((0, _moment["default"])(new Date(date)).fromNow());
      }
    }));
    wrapper.find(_App["default"]).simulate('click');
    expect(reviewsModalBody.find('#modalText').text()).toEqual('someting');
  });
});