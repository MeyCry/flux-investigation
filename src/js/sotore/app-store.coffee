AppDispatcher = require("../dispatchers/app-dispatcher.js")
AppConstants = require("../constants/app-constants.js")
EventEmitter = require("events").EventEmitter

CHANGE_EVENT = "change"


_catalog = [
  {id: 1, title: "Widget #1", cost: 1}
  {id: 2, title: "Widget #2", cost: 2}
  {id: 3, title: "Widget #3", cost: 3}
]

_cartItems = []

_removeItem = (index) ->
  _cartItems[index].inCart = no
  _cartItems[index].slice(index, 1)

_increaseItem = (index) ->
  _cartItems[index].qty++

_decreaseItem = (index) ->
  if _cartItems[index].qty > 1
    _cartItems[index].qty--
  else
    _removeItem(index)

_addItem = (item) ->
  if not item.inCart
    item["qty"] = 1
    item["inCart"] = yes
    _cartItems.push(item)

  else
    _cartItems.forEach (cartItem, i) ->
      if cartItem.id is item.id
        _increaseItem(i)


EventEmitter::emitChange = ->
  @emit(CHANGE_EVENT)

EventEmitter::addChangeListener = (callback) ->
  @on(CHANGE_EVENT, callback)

EventEmitter::removeChangeListener = (callback) ->
  @removeListener(CHANGE_EVENT, callback)

EventEmitter::getCart = ->
  _cartItems

EventEmitter::getCatalog = ->
  _catalog

EventEmitter::dispatcherIndex = AppDispatcher.register (payload) ->
  action = payload.action # from handleViewAction

  switch action.actionType
    when AppConstants.ADD_ITEM
      _addItem(payload.action.item)

    when AppConstants.REMOVE_ITEM
      _removeItem(payload.action.index)

    when AppConstants.INCREASE_ITEM
      _increaseItem(payload.action.index)

    when AppConstants.DECREASE_ITEM
      _decreaseItem(payload.action.index)

  EventEmitter::emitChange()

  return true

AppStore = EventEmitter

module.exports = AppStore