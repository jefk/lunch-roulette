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
    @_search isFeelingLucky: true

  _search: (options = {}) ->
    rawInput = React.findDOMNode(@refs.search).value.trim()

    tags = (tag for tag in rawInput.split(/\s+/) when tag.length > 0)
    return unless tags.length > 0

    args = $.extend options, tags: tags
    @props.events.trigger 'search:new', args

  _clear: ->
    React.findDOMNode(@refs.search).value = ''
