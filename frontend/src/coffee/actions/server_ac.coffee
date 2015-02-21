dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")


module.exports = {
  update_playlist: (playlist) ->
    dispatcher.handleServerAction({
      type: constants.UPDATE_PLAYLIST,
      playlist: playlist
    })
}