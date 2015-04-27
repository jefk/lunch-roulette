window.LRItemForm = React.createClass
  render: ->
    <form className="item-form" noValidate="novalidate" onSubmit={@formDidSubmit}>
      <input type="email" placeholder="carmine's @greenpoint @pizza" ref="item"/>
      <input type="submit" value="Add it" />
    </form>

  componentDidMount: ->
    @props.events.on 'item:complete', => @_clear()

  formDidSubmit: (e) ->
    e.preventDefault()
    rawInput = React.findDOMNode(@refs.item).value.trim()

    parser = new models.ItemParser rawInput
    return unless parser.isValid()

    @props.events.trigger 'item:new', name: parser.name(), tags: parser.tags()

  _clear: ->
    React.findDOMNode(@refs.item).value = ''
