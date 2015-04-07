window.LRItemList = React.createClass
  render: ->
    <div className="item-list">
      <ul>
        {@items()}
      </ul>
    </div>

  items: ->
    @props.items.map (item) ->
      <li key={item.id}>
        {item.name}
      </li>
