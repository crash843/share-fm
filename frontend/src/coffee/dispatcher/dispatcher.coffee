Dispatcher = require("flux").Dispatcher

dispatcher = new Dispatcher()

dispatcher.handleViewAction = (action) ->
  console.log("Dispatching view action: ", action)
  @dispatch({
    source: 'VIEW_ACTION'
    action: action
  })

dispatcher.handleServerAction = (action) ->
  console.log("Dispatching server action: ", action)
  @dispatch({
    source: 'SERVER_ACTION'
    action: action
  })

module.exports = dispatcher