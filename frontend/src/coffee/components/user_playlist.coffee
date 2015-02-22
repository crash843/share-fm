React = require("react")
UserPlaylistStore = require("../stores/user_playlist_store")

PlaylistItem = require("./playlist_item")


UserPlaylist = React.createClass({
  getInitialState: ->
    @_get_state_from_stores()

  componentDidMount: ->
    UserPlaylistStore.on("change", @_on_change);

  componentWillUnmount: ->
    UserPlaylistStore.removeListener("change", @_on_change)

  render: ->
    user_playlist_items = @state.user_playlist.map((track) -> <PlaylistItem key={track.id} track={track}/>)

    return (
      <ul>
         {user_playlist_items}
      </ul>
    )

  _get_state_from_stores: ->
    {
      "user_playlist": UserPlaylistStore.get_user_playlist()
    }

  _on_change: ->
    @setState(@_get_state_from_stores())
})

module.exports = UserPlaylist