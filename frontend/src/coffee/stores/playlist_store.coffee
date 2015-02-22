EventEmitter = require("events").EventEmitter
dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")
_ = require('lodash')


_playlist = []

load_playlist = (data)->
  _playlist = data

PlaylistStore = _.extend({}, EventEmitter.prototype, {
  get_playlist: ->
    _playlist
})

dispatcher.register((payload) ->
  switch payload.action.actionType
    when constants.action_types.UPDATE_PLAYLIST then load_playlist(payload.action.playlist)

  PlaylistStore.emit("change")
  true
)

module.exports = PlaylistStore
