window.LRItemSearch = React.createClass
  render: ->
    <form className="item-search-form" noValidate="novalidate" onSubmit={@formDidSubmit}>
      <input type="text" placeholder="greenpoint pizza" ref="search"/>
      <input type="submit" value="Search" />
    </form>

  formDidSubmit: (e) ->
    e.preventDefault()
    rawInput = React.findDOMNode(@refs.search).value.trim()

    tags = rawInput.split /\s+/
    return unless tags.length > 0

    @props
      .newSearchDidSubmit tags
      .done @_clear

  _clear: ->
    React.findDOMNode(@refs.search).value = ''
