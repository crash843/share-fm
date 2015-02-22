React = require("react")
UserPlaylistStore = require("../stores/user_playlist_store")
SearchResultsStore = require("../stores/search_results_store")
actions = require("../actions/actions")

PlaylistItem = require("./playlist_item")


UserPlaylist = React.createClass({
  getInitialState: ->
    @_get_state_from_stores()

  componentDidMount: ->
    UserPlaylistStore.on("change", @_on_change);
    SearchResultsStore.on("change", @_on_change);

  componentWillUnmount: ->
    UserPlaylistStore.removeListener("change", @_on_change)
    SearchResultsStore.removeListener("change", @_on_change)

  handle_search: (event) ->
    event.preventDefault();
    actions.view.search(event.target[0].value)

  render: ->
    console.log("RENDERING")
    user_playlist_items = @state.user_playlist.map((track) -> <PlaylistItem key={track.id} track={track}/>)

    search_playlist_items = @state.search_results.results.map((track) -> <PlaylistItem key={track.id} track={track}/>)

    searching = if @state.search_results.status == "inprogress" then "Searching..." else ""
    console.log("searching is", searching)

    return (
      <div>
         <form onSubmit={this.handle_search}>
            <input type="text" placeholder="Search tracks" />
            <input type="submit" value="Search" />
         </form>
         <span>{searching}</span>
         <ul>
            {search_playlist_items}
         </ul>
         <br/>
         <ul>
            {user_playlist_items}
         </ul>
      </div>
    )

  _get_state_from_stores: ->
    {
      "user_playlist": UserPlaylistStore.get_user_playlist()
      "search_results": SearchResultsStore.get_search_results()
    }

  _on_change: ->
    @setState(@_get_state_from_stores())
})

module.exports = UserPlaylist