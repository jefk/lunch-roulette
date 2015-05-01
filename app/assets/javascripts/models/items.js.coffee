class models.Items
  constructor: ->

  @create: (args) ->
    Item = @_itemObject()
    item = new Item()
    item.save(args)

  @delete: (item) ->
    item.set 'visible', false
    item.save()

  @findByTags: (tags) ->
    tags ?= []
    query = new Parse.Query @_itemObject()
    query.equalTo('visible', true)
    query.containsAll('tags', tags) if tags.length > 0

    query.find()

  @_itemObject: ->
    @__itemObject ?= Parse.Object.extend 'ItemObject'
