React = require("react")
PlaylistStore = require("../stores/playlist_store")

PlaylistItem = require("./playlist_item")


Playlist = React.createClass({
  getInitialState: ->
    @_get_state_from_stores()

  componentDidMount: ->
    PlaylistStore.on("change", @_on_change);

  componentWillUnmount: ->
    PlaylistStore.removeListener("change", @_on_change)

  render: ->
    playlist_items = @state.playlist.map((track) -> <PlaylistItem key={track.id} track={track}/>)

    return (
      <ul>
         {playlist_items}
      </ul>
    )

  _get_state_from_stores: ->
    {
      "playlist": PlaylistStore.get_playlist()
    }

  _on_change: ->
    @setState(@_get_state_from_stores())
})

module.exports = Playlist