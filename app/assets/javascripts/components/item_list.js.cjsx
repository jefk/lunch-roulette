items = [
  {name: 'foo', id: 1},
  {name: 'bar', id: 2},
]

window.LRItemList = React.createClass
  items: ->
    items.map (item) ->
      <li key={item.id}>
        {item.name}
      </li>

  render: ->
    <div className="item-list">
      <ul>
        {@items()}
      </ul>
    </div>
