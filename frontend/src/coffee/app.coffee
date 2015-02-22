actions = require("./actions/actions")
playlist_mock = require("./mocks/playlist")
user_playlist_mock = require("./mocks/user_playlist")
Playlist = require("./components/playlist")
UserPlaylist = require("./components/user_playlist")
CurrentTrack = require("./components/current_track")


React = require("react/addons")

React.render(
  <Playlist />,
  document.getElementById("playlist")
)

React.render(
  <UserPlaylist />,
  document.getElementById("user-playlist")
)

React.render(
  <CurrentTrack />,
  document.getElementById("current-track")
)

actions.server.update_playlist(playlist_mock)
actions.server.update_user_playlist(user_playlist_mock)