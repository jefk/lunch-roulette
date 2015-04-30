window.LRItemSearch = React.createClass
  render: ->
    <form className="item-search-form" noValidate="novalidate" onSubmit={@formDidSubmit}>
      <input type="text" placeholder="greenpoint pizza" ref="search"/>
      <input type="submit" value="Search" />
    </form>

  componentDidMount: ->
    @props.events.on 'search:complete', => @_clear()

  formDidSubmit: (e) ->
    e.preventDefault()
    rawInput = React.findDOMNode(@refs.search).value.trim()

    tags = (tag for tag in rawInput.split(/\s+/) when tag.length > 0)
    return unless tags.length > 0

    @props.events.trigger 'search:new', tags: tags

  _clear: ->
    React.findDOMNode(@refs.search).value = ''
