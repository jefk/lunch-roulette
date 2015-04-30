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
    Item = Parse.Object.extend 'ItemObject'
    item = new Item()
    item.save(args)
      .done (data) =>
        @_fetchData()
        @events.trigger 'item:complete'
      .fail (response) =>
        console.error response

  _deleteItem: (item) ->
    item.set 'visible', false
    item.save()
      .done (data) =>
        @_fetchData()
      .fail (response) =>
        console.error response

  _fetchData: (options) ->
    tags = options?.tags || []

    Item = Parse.Object.extend 'ItemObject'

    query = new Parse.Query(Item)
    query.equalTo('visible', true)
    query.containsAll('tags', tags) if tags.length > 0

    query.find()
      .done (data) =>
        @setState items: data
        @events.trigger 'search:complete'
      .fail (response) =>
        console.error response

  _csrfToken: ->
    @__csrf ?= $('meta[name=csrf-token]').attr('content')
