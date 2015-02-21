actions = require("./actions/actions")
playlist_mock = require("./mocks/playlist")
Playlist = require("./components/playlist")
CurrentTrack = require("./components/current_track")


React = require("react/addons")

React.render(
  <Playlist />,
  document.getElementById("playlist")
)

React.render(
  <CurrentTrack />,
  document.getElementById("current-track")
)

actions.server.update_playlist(playlist_mock)