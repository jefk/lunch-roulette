items = [
  {name: 'foo'},
  {name: 'bar'},
]

window.LRItemList = React.createClass
  render: ->
    <div className="item-list">
      <ul>
        <li>foo</li>
        <li>bar</li>
      </ul>
    </div>
