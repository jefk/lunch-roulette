window.LRItemBox = React.createClass
  events: $({})

  render: ->
    <div className="item-box">
      <h1>I am the ItemBox</h1>
      <LRItemList items={@state.items}/>
      <LRItemForm newItemDidSubmit={@_createItem}/>
      <LRItemSearch events={@events}/>
    </div>

  getInitialState: ->
    items: []

  componentDidMount: ->
    @_fetchData()

    @events.on 'search:new', (event, searchParams) =>
      @_fetchData searchParams

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
      data: args
      headers: {'X-CSRF-Token': @_csrfToken()}
    .done (data) =>
      @setState items: data.items
      @events.trigger 'search:complete'
    .fail (xhr, status, err) =>
      console.error status, err.toString()

  _csrfToken: ->
    @__csrf ?= $('meta[name=csrf-token]').attr('content')
