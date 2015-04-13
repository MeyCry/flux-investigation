React = require("react");
AppActions = require("../actions/app-actions.js");

RemoveFromCart = React.createClass

  handleClick: ->
    AppActions.removeItem(@props.index)

  render: ->
    return `<button onClick={this.handleClick}>x</button>`


module.exports = RemoveFromCart;
