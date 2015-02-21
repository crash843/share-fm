Dispatcher = require("flux").Dispatcher

dispatcher = new Dispatcher()

dispatcher.handleAction = (action) ->
  @dispatch({
    source: 'VIEW_ACTION'
    action: action
  })

dispatcher.handleServerAction = (action) ->
  @dispatch({
    source: 'SERVER_ACTION'
    action: action
  })

module.exports = dispatcher