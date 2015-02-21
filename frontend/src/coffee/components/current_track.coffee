React = require("react")
PlaylistStore = require("../stores/playlist_store")


CurrentTrack = React.createClass({
  getInitialState: ->
    @_get_state_from_stores()

  componentDidMount: ->
    PlaylistStore.on("change", @_on_change);

  componentWillUnmount: ->
    PlaylistStore.removeListener("change", @_on_change)

  render: ->
    track = if @state.playlist.length then @state.playlist[0] else {
      "id": 1,
      "artist": "None",
      "title": "None"
    }

    console.log(track)

    return (
      <div className="wrapper">
       <img className="play-button" src="img/play_button.png"/>
       <div className="info">
          <span className="title">{track.title}</span>
          <span className="artist">by {track.artist}</span>
          <span className="progress"></span>
       </div>
      </div>
    )

  _get_state_from_stores: ->
    {
      "playlist": PlaylistStore.get_playlist()
    }

  _on_change: ->
    @setState(@_get_state_from_stores())
})

module.exports = CurrentTrack