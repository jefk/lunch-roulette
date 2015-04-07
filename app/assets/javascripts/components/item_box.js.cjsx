window.LRItemBox = React.createClass
  render: ->
    <div className="item-box">
      <h1>I am the ItemBox</h1>
      <LRItemList items={@state.items}/>
    </div>

  getInitialState: ->
    items: [
      {name: 'x-wing', id: 5},
      {name: 'z95', id: 4},
    ]
