React = require("react")


Playlist = React.createClass({
  propTypes: ->
    {
      track: ReactPropTypes.object
    }

  render: ->
    track = @props.track

    return (
       <li class="playlist-item">
          {track.artist} - {track.title} ({track.duration}s)
       </li>
    )
})

module.exports = Playlist