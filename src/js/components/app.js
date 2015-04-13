// Generated by CoffeeScript 1.9.1
(function() {
  var APP, Cart, Catalog, React;

  React = require("react");

  Catalog = require("../components/app-catalog.js");

  Cart = require("../components/app-cart.js");

  APP = React.createClass({
    render: function() {
      return (
        <div>
            <h1>Lets Shop</h1>
            <Catalog />
            <h2>Cart</h2>
            <Cart />
        </div>
        );
    }
  });

  module.exports = APP;

}).call(this);