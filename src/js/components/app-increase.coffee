React = require("react");
AppActions = require("../actions/app-actions.js");

Increase = React.createClass

  handleClick: ->
    AppActions.increaseItem(@props.index)

  render: ->
    return `<button onClick={this.handleClick}>+</button>`


module.exports = Increase;
