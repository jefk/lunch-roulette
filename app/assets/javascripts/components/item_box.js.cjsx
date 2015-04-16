window.LRItemBox = React.createClass
  render: ->
    <div className="item-box">
      <h1>I am the ItemBox</h1>
      <LRItemList items={@state.items}/>
      <LRItemForm newItemDidSubmit={@_createItem}/>
      <LRItemSearch newSearchDidSubmit={@_fetchData}/>
    </div>

  getInitialState: ->
    items: []

  componentDidMount: ->
    @_fetchData()

  _createItem: (args) ->
    $.ajax
      url: '/api/items'
      type: 'POST'
      dataType: 'json'
      data: {item: args}
      headers: {'X-CSRF-Token': @_csrfToken()}
    .done (data) =>
      @setState items: data.items
    .fail (xhr, status, err) =>
      console.error status, err.toString()

  _fetchData: (args) ->
    args ?= {tags: []}
    $.ajax
      url: '/api/searches'
      type: 'POST'
      dataType: 'json'
      data: {search: args}
      headers: {'X-CSRF-Token': @_csrfToken()}
    .done (data) =>
      @setState items: data.items
    .fail (xhr, status, err) =>
      console.error status, err.toString()

  _csrfToken: ->
    @__csrf ?= $('meta[name=csrf-token]').attr('content')
