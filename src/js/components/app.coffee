React = require("react");
Catalog = require("../components/app-catalog.js");
Cart = require("../components/app-cart.js");


APP = React.createClass

#  handleClick: ->
#    AppActions.addItem("this is the item")

  render: ->
    return `(
        <div>
            <h1>Lets Shop</h1>
            <Catalog />
            <h2>Cart</h2>
            <Cart />
        </div>
        )`



module.exports = APP;

