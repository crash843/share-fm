EventEmitter = require("events").EventEmitter
dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")
_ = require('lodash')


_user_playlist = []

load_user_playlist = (data)->
  console.log(data)
  _user_playlist = data

UserPlaylistStore = _.extend({}, EventEmitter.prototype, {
  get_user_playlist: ->
    _user_playlist
})

dispatcher.register((payload) ->
  switch payload.action.actionType
    when constants.action_types.UPDATE_USER_PLAYLIST then load_user_playlist(payload.action.user_playlist)

  UserPlaylistStore.emit("change")
  true
)

module.exports = UserPlaylistStore
