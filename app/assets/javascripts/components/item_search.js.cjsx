window.LRItemSearch = React.createClass
  render: ->
    <form className="item-search-form" noValidate="novalidate">
      <input type="text" placeholder="greenpoint pizza" ref="search"/>
      <button onClick={@didTapSearch}>Search</button>
      <button onClick={@isFeelingLucky}>Lucky</button>
    </form>

  didTapSearch: (event) ->
    event.preventDefault()
    @_search()

  isFeelingLucky: (event) ->
    event.preventDefault()
    @_search(1)

  _search: (limit) ->
    rawInput = React.findDOMNode(@refs.search).value.trim()

    tags = (tag for tag in rawInput.split(/\s+/) when tag.length > 0)
    return unless tags.length > 0

    @props.events.trigger 'search:new', tags: tags, limit: limit

  _clear: ->
    React.findDOMNode(@refs.search).value = ''
