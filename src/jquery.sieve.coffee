###
jQuery Sieve
Table and Container Filtering and Search for jQuery
Copyright (c) 2013 Ryan McGeary; Licensed MIT
###
$ = jQuery
$.fn.sieve = (options) ->
  compact = (array) -> item for item in array when item

  this.each ->
    container = $(this)
    settings = $.extend({
      searchInput: null
      searchTemplate: "<div><label>Search: <input type='text'></label></div>"
      itemSelector: "tbody tr"
      textSelector: null
      toggle: (item, match) -> item.toggle(match)
      complete: ->
    }, options)

    if !settings.searchInput
      searchBar = $(settings.searchTemplate)
      settings.searchInput = searchBar.find("input")
      container.before(searchBar)

    settings.searchInput.on "keyup.sieve change.sieve", ->
      query = compact($(this).val().toLowerCase().split(/\s+/))
      items = container.find(settings.itemSelector)

      items.each ->
        item = $(this)
        if settings.textSelector
          cells = item.find(settings.textSelector)
          text = cells.text().toLowerCase()
        else
          text = item.text().toLowerCase()

        match = true
        for q in query
          match &&= text.indexOf(q) >= 0

        settings.toggle(item, match)

      settings.complete()
