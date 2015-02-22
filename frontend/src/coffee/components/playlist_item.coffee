React = require("react")


PlaylistItem = React.createClass({
  propTypes: ->
    {
      track: ReactPropTypes.object
    }

  render: ->
    track = @props.track

    return (
       <li className="playlist-item">
          {track.artist} - {track.title} ({track.duration}s)
       </li>
    )
})

module.exports = PlaylistItem