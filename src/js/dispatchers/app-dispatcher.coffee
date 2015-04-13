Promise = require("es6-promise").Promise;

_callbacks = [];
_promises = [];

_addPromise = (callback, payload) ->
  _promises.push new Promise (resolve, reject) ->

    if callback(payload)
      resolve(payload)

    else
      reject new Error("Dispatcher callback unsuccessful")

_clearPromises = ->
  _promises = []


Dispatcher = ->

Dispatcher::register = (callback) ->
  _callbacks.push(callback)
  _callbacks.length - 1 # index

Dispatcher::dispatch = (payload) ->
  _callbacks.forEach (callback) ->
    _addPromise(callback, payload)

  Promise.all(_promises).then(_clearPromises)

# handlers:

Dispatcher::handleViewAction = (action) ->
  console.log action
  @dispatch
    source: "VIEW_ACTION"
    action: action

AppDispatcher = Dispatcher

module.exports = AppDispatcher
