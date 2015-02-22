dispatcher = require("../dispatcher/dispatcher")
constants = require("../constants/constants")


module.exports = {
  update_playlist: (playlist) ->
    dispatcher.handleServerAction({
      actionType: constants.action_types.UPDATE_PLAYLIST,
      playlist: playlist
    })
  update_user_playlist: (user_playlist) ->
    dispatcher.handleServerAction({
      actionType: constants.action_types.UPDATE_USER_PLAYLIST,
      user_playlist: user_playlist
    })
  update_search_results: (tracks) ->
    dispatcher.handleServerAction({
      actionType: constants.action_types.UPDATE_SEARCH_RESULTS,
      tracks: tracks
    })
}