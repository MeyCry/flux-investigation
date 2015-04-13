React = require("react");
AppStore = require("../sotore/app-store.js");
RemoveFromCart = require("../components/app-removefromcart.js")
Increase = require("../components/app-increase.js")
Decrease = require("../components/app-decrease.js")

cartItems = -> {items: AppStore::getCart()}

Cart = React.createClass
  getInitialState: -> cartItems()

  componentWillMount: ->
    AppStore::addChangeListener(@_onChange)
    setTimeout =>
      @setState(cartItems())
    , 1000

  _onChange: ->

    @setState(cartItems())

  render: ->
    total = 0
    items = @state.items.map (item, i) ->
      subtotal = item.cost * item.qty
      total += subtotal

      return `(
          <tr key={i}>
              <td><RemoveFromCart index={i} /></td>
              <td>{item.title}</td>
              <td>{item.qty}</td>
              <td>
                <Increase index={i} />
                <Decrease index={i} />
              </td>
              <td>${subtotal}</td>
          </tr>
      )`

    return `(
        <table className="table table-hover">
            <thead>
              <tr>
                <th></th>
                <th>Item</th>
                <th>Qty</th>
                <th></th>
                <th>Subtotal</th>
              </tr>
            </thead>
            <tbody>
              {items}
            </tbody>
            <tfoot>
              <tr>
                <td colSpan="4" className="text-right">Total</td>
                <td>${total}</td>
              </tr>
            </tfoot>
        </table>
    )`

module.exports = Cart