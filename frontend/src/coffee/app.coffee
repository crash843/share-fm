actions = require("./actions/actions")
playlist_mock = require("./mocks/playlist")
Playlist = require("./components/playlist")


React = require("react/addons")

React.render(
  <Playlist />,
  document.getElementById("playlist")
)

actions.server.update_playlist(playlist_mock)