window.LRItemList = React.createClass
  render: ->
    <div className="item-list">
      {@items()}
    </div>

  items: ->
    @props.items.map (item) ->
      <div className="item-row" key={item.id}>
        <p className="item-name">{item.name}</p>
        <p className="item-tags">{item.tags}</p>
      </div>
