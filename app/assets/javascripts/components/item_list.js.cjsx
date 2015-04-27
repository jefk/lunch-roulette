window.LRItemList = React.createClass
  render: ->
    <div className="item-list">
      {@items()}
    </div>

  items: ->
    @props.items.map (item) =>
      <LRItem item={item} key={item.id} itemId={item.id} events={@props.events} />
