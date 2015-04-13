React = require("react");
AppActions = require("../actions/app-actions.js");

Decrease = React.createClass

  handleClick: ->
    AppActions.decreaseItem(@props.index)

  render: ->
    return `<button onClick={this.handleClick}>-</button>`


module.exports = Decrease;
