window.LRItemList = React.createClass
  render: ->
    <div className="item-list">
      {@items()}
    </div>

  items: ->
    @props.items.map (item) ->
      <div className="item" key={item.id}>
        {item.name}
      </div>
