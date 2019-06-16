"use strict";

var createReactClass = require('create-react-class');

var DOM = require('react-dom-factories');

var div = DOM.div,
    button = DOM.button,
    ul = DOM.ul,
    li = DOM.li; // This is just a simple example of a component that can be rendered on both
// the server and browser

module.exports = createReactClass({
  displayName: "exports",
  // We initialise its state by using the `props` that were passed in when it
  // was first rendered. We also want the button to be disabled until the
  // component has fully mounted on the DOM
  getInitialState: function getInitialState() {
    return {
      items: this.props.items,
      disabled: true
    };
  },
  // Once the component has been mounted, we can enable the button
  componentDidMount: function componentDidMount() {
    this.setState({
      disabled: false
    });
  },
  // Then we just update the state whenever its clicked by adding a new item to
  // the list - but you could imagine this being updated with the results of
  // AJAX calls, etc
  handleClick: function handleClick() {
    console.log('Click!');
  },
  render: function render() {
    return div(null, button({
      onClick: this.handleClick,
      disabled: this.state.disabled
    }, 'Add Item'));
  }
});