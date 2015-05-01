window.LRItemBox = React.createClass
  events: $({})

  render: ->
    <div className="item-box">
      <h1>I am the ItemBox</h1>
      <LRItemList items={@state.items} events={@events}/>
      <LRItemForm events={@events}/>
      <LRItemSearch events={@events}/>
    </div>

  getInitialState: ->
    items: []

  componentDidMount: ->
    @_fetchData()

    @events.on 'search:new', (event, searchParams) =>
      @_fetchData searchParams

    @events.on 'item:new', (event, itemParams) =>
      @_createItem itemParams

    @events.on 'item:delete', (event, itemId) =>
      @_deleteItem itemId

  _createItem: (args) ->
    models.Items.create(args)
      .done (data) =>
        @_fetchData()
        @events.trigger 'item:complete'
      .fail (response) =>
        console.error response

  _deleteItem: (item) ->
    models.Items.delete(item)
      .done (data) =>
        @_fetchData()
      .fail (response) =>
        console.error response

  _fetchData: (options = {}) ->
    models.Items.findByTags(options.tags, limit: options.limit)
      .done (data) =>
        @setState items: data
        @events.trigger 'search:complete'
      .fail (response) =>
        console.error response

  _csrfToken: ->
    @__csrf ?= $('meta[name=csrf-token]').attr('content')
