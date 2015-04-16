window.LRItemForm = React.createClass
  render: ->
    <form className="item-form" noValidate="novalidate" onSubmit={@formDidSubmit}>
      <input type="email" placeholder="carmine's @greenpoint @pizza" ref="item"/>
      <input type="submit" value="Add it" />
    </form>

  formDidSubmit: (e) ->
    e.preventDefault()
    rawInput = React.findDOMNode(@refs.item).value.trim()

    parser = new models.ItemParser rawInput
    return unless parser.isValid()

    @props
      .newItemDidSubmit(name: parser.name(), tags: parser.tags())
      .done(@_clear)

  _clear: ->
    React.findDOMNode(@refs.item).value = ''
