React = require("react");
AppStore = require("../sotore/app-store.js");
AddToCart = require("../components/app-addtocart.js")

getCatalog = -> {items: AppStore::getCatalog()}

Catalog = React.createClass
  getInitialState: -> getCatalog()

  render: ->
    items = @state.items.map (item, i) ->
      return `(
          <tr>
              <td>{item.title}</td>
              <td>${item.cost}</td>
              <td><AddToCart item={item} /></td>
          </tr>
      )`

    return `(
      <table className="table table-hover">
          {items}
      </table>
    )`

module.exports = Catalog