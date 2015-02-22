EventEmitter = require("events").EventEmitter
dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")
_ = require('lodash')


_search_results = {
  status: "done",
  results: []
}

load_search_results = (data) ->
  console.log("LOADING SEARCH RESULTS")
  _search_results.results = data
  _search_results.status = "done"

  console.log(_search_results)

start_searching = () ->
  _search_results.status = "inprogress"

SearchResultsStore = _.extend({}, EventEmitter.prototype, {
  get_search_results: ->
    _search_results
})

dispatcher.register((payload) ->
  switch payload.action.actionType
    when constants.action_types.UPDATE_SEARCH_RESULTS then load_search_results(payload.action.tracks)
    when constants.action_types.SEARCH then start_searching()

  console.log("EMIT CHANGE")
  SearchResultsStore.emit("change")
  true
)

module.exports = SearchResultsStore
