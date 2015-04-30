window.LRItem = React.createClass
  render: ->
    <div className="item-row">
      <h3>{@props.item.attributes.name}</h3>
      <ul className="inline">{@_tags()}</ul>
      <span className="delete" onClick={@didTapDelete}>x</span>
    </div>

  didTapDelete: ->
    @props.events.trigger 'item:delete', @props.item.id

  _tags: ->
    @props.item.attributes.tags.map (tag) ->
      <li>{tag}</li>
