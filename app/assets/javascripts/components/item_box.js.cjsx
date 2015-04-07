window.LRItemBox = React.createClass
  render: ->
    <div className="item-box">
      <h1>I am the ItemBox</h1>
      <LRItemList items={@state.items}/>
      <LRItemForm submitCallback={@_createItem}/>
    </div>

  getInitialState: ->
    items: [
      {name: 'x-wing', id: 5},
      {name: 'z95', id: 4},
    ]

  componentDidMount: ->
    @_fetchData()

  _createItem: (args) ->
    $.ajax
      url: '/api/items',
      type: 'POST',
      dataType: 'json',
      data: args,
      success: (data) =>
        # @setState items: data.items
        console.log 'success'
      error: (xhr, status, err) =>
        console.error status, err.toString()

  _fetchData: ->
    $.ajax
      url: '/api/items',
      dataType: 'json',
      success: (data) =>
        @setState items: data.items
      error: (xhr, status, err) =>
        console.error status, err.toString()
