window.LRItem = React.createClass
  render: ->
    <div className="item-row">
      <h3>{@props.item.name}</h3>
      <p>{@props.item.tags}</p>
      <span className="delete" onClick={@didTapDelete}>x</span>
    </div>

  didTapDelete: ->
    @props.events.trigger 'item:delete', @props.itemId
