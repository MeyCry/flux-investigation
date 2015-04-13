React = require("react");
AppActions = require("../actions/app-actions.js");

AddToCart = React.createClass

  handleClick: ->
    AppActions.addItem(@props.item)

  render: ->
    return `<button onClick={this.handleClick}>Add to cart</button>`


module.exports = AddToCart;
