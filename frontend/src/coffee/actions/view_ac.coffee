dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")

server_ac = require("./server_ac")
search_results_mock = require("../mocks/search_results")

module.exports = {
  search: (text) ->
    dispatcher.handleViewAction({
      actionType: constants.action_types.SEARCH,
      text: text
    })

    setTimeout((() -> server_ac.update_search_results(search_results_mock)), 2000)
}