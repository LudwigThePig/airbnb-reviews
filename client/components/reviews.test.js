import React from 'react';
import { shallow, mount } from 'enzyme';
import moment from 'moment';
import Reviews from './reviews.jsx';
import Review from './review.jsx';


describe('Reviews', () => {

  it('format Date formats a date properly', () => {
    const wrapper = shallow(<Review review={{ 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' }} formatDate={(date) => String(moment(new Date(date)))} />);
    expect(wrapper.find('.reviewDate').text()).toEqual(String(moment(new Date('2019-05-03'))));
  });

  it('displays text, user, and photo properly', () => {
    const wrapper = shallow(<Review review={{ 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' }} formatDate={(date) => String(moment(new Date(date)))} />);
    expect(wrapper.find('.reviewText').text()).toEqual('someting');
    expect(wrapper.find('.reviewUser').text()).toEqual('me');
    expect(wrapper.find('.reviewPhoto').prop('src')).toEqual('https://unsplash.com/photos/G6ntxf-QoSI')
  });

  it('renders all reviews', () => {
    const reviews = [
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' },
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' },
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' },
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' },
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' },
      { 'date': '2019-05-03', 'text': 'someting', 'user': 'me', photo: 'https://unsplash.com/photos/G6ntxf-QoSI' }
    ];
    const wrapper = mount(<Reviews reviews={reviews} formatDate={(date) => String(moment(new Date(date)))} />);
    expect(wrapper.find('.row').children().length).toEqual(6);
  });

});