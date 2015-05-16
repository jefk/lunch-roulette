window.LRItemList = React.createClass
  render: ->
    <div className="item-list-wrapper">
      <div className="item-list">
        {@items()}
      </div>
    </div>

  items: ->
    @props.items.map (item) =>
      <LRItem item={item} key={item.id} events={@props.events} />
