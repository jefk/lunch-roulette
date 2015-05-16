window.LRItemBox = React.createClass
  events: $({})

  render: ->
    <div className="item-box">
      <h1 className="logo">Tomato</h1>
      <LRItemList items={@state.items} events={@events}/>
      <LRItemForm events={@events}/>
      <LRItemSearch events={@events}/>
    </div>

  getInitialState: ->
    items: []

  componentDidMount: ->
    @_fetchData isFeelingLucky: true

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
    models.Items.findByTags(options.tags)
      .done (data) =>
        @setState items: @_applyLuck(data, options)
        @events.trigger 'search:complete'
      .fail (response) =>
        console.error response

  _applyLuck: (data, options) ->
    data.sort -> (0.5 - Math.random())
    return data unless options.isFeelingLucky
    data.slice(0,1)

  _csrfToken: ->
    @__csrf ?= $('meta[name=csrf-token]').attr('content')
