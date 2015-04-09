window.LRItem = React.createClass
  render: ->
    <div className="item-row">
      <h3>{@props.item.name}</h3>
      <p>{@props.item.tags}</p>
    </div>
