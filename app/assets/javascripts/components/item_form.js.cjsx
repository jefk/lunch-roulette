window.LRItemForm = React.createClass
  render: ->
    <form className="item-form" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Carmine's" ref="name"/>
      <input type="text" placeholder="greenpoint pizza" ref="tags"/>
      <input type="submit" value="Add it" />
    </form>

  handleSubmit: (e) ->
    e.preventDefault()
    name = React.findDOMNode(@refs.name).value.trim()
    tags = React.findDOMNode(@refs.tags).value.trim()
    return unless name and tags

    console.log name, tags
