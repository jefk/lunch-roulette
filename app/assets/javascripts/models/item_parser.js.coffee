class models.ItemParser
  constructor: (@rawInput) ->

  name: ->
    @__name ?= @rawInput.split('@')[0]?.trim()

  tags: ->
    @__tags ?= @_unique @_parts()[1..]

  isValid: ->
    @name() and @tags().length > 0

  _parts: ->
    @__parts ?= (@_normalize(part) for part in @rawInput.split('@') when part.trim().length > 0)

  _normalize: (tag) ->
    tag.trim().toLowerCase().replace(/ /g, '')

  _unique: (arr) ->
    # NOTE: ??? I got it from stackoverflow
    index = {}
    for text in arr when not (text of index)
      index[text] = true
      text
