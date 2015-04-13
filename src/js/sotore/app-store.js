// Generated by CoffeeScript 1.9.1
(function() {
  var AppConstants, AppDispatcher, AppStore, CHANGE_EVENT, EventEmitter, _addItem, _cartItems, _catalog, _decreaseItem, _increaseItem, _removeItem;

  AppDispatcher = require("../dispatchers/app-dispatcher.js");

  AppConstants = require("../constants/app-constants.js");

  EventEmitter = require("events").EventEmitter;

  CHANGE_EVENT = "change";

  _catalog = [
    {
      id: 1,
      title: "Widget #1",
      cost: 1
    }, {
      id: 2,
      title: "Widget #2",
      cost: 2
    }, {
      id: 3,
      title: "Widget #3",
      cost: 3
    }
  ];

  _cartItems = [];

  _removeItem = function(index) {
    console.log(_cartItems);
    _cartItems[index].inCart = false;
    return _cartItems.splice(index, 1);
  };

  _increaseItem = function(index) {
    return _cartItems[index].qty++;
  };

  _decreaseItem = function(index) {
    if (_cartItems[index].qty > 1) {
      return _cartItems[index].qty--;
    } else {
      return _removeItem(index);
    }
  };

  _addItem = function(item) {
    if (!item.inCart) {
      item["qty"] = 1;
      item["inCart"] = true;
      return _cartItems.push(item);
    } else {
      return _cartItems.forEach(function(cartItem, i) {
        if (cartItem.id === item.id) {
          return _increaseItem(i);
        }
      });
    }
  };

  EventEmitter.prototype.emitChange = function() {
    console.log(CHANGE_EVENT);
    return this.emit(CHANGE_EVENT);
  };

  EventEmitter.prototype.addChangeListener = function(callback) {
    return this.on(CHANGE_EVENT, callback);
  };

  EventEmitter.prototype.removeChangeListener = function(callback) {
    return this.removeListener(CHANGE_EVENT, callback);
  };

  EventEmitter.prototype.getCart = function() {
    return _cartItems;
  };

  EventEmitter.prototype.getCatalog = function() {
    return _catalog;
  };

  EventEmitter.prototype.dispatcherIndex = AppDispatcher.prototype.register(function(payload) {
    var action;
    action = payload.action;
    switch (action.actionType) {
      case AppConstants.ADD_ITEM:
        _addItem(payload.action.item);
        break;
      case AppConstants.REMOVE_ITEM:
        console.log(payload.action);
        _removeItem(payload.action.index);
        break;
      case AppConstants.INCREASE_ITEM:
        _increaseItem(payload.action.index);
        break;
      case AppConstants.DECREASE_ITEM:
        _decreaseItem(payload.action.index);
    }
    EventEmitter.prototype.emitChange();
    return true;
  });

  AppStore = EventEmitter;

  module.exports = AppStore;

}).call(this);
