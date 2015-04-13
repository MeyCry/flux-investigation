AppConstants = require("../constants/app-constants.js")
AppDispatcher = require("../dispatchers/app-dispatcher.js")

AppActions = {
  addItem: (item) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.ADD_ITEM
      item: item

  removeItem: (index) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.REMOVE_ITEM
      index: index

  decreaseItem: (index) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.DECREASE_ITEM
      index: index

  increaseItem: (index) ->
    AppDispatcher.handleViewAction
      actionType: AppConstants.INCREASE_ITEM
      index: index
}


module.exports = AppActions
