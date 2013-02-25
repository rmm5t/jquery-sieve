###
Table and Container Filtering and Search for jQuery
version: 0.2.2

Licensed under the MIT:
http://www.opensource.org/licenses/mit-license.php

Copyright 2013 Ryan McGeary
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
    }, options)

    if !settings.searchInput
      searchBar = $(settings.searchTemplate)
      settings.searchInput = searchBar.find("input")
      container.before(searchBar)

    settings.searchInput.on "keyup.sieve change.sieve", ->
      query = compact($(this).val().toLowerCase().split(/\s+/))
      rows = container.find(settings.itemSelector)

      rows.each ->
        row = $(this)
        if settings.textSelector
          cells = row.find(settings.textSelector)
          text = cells.text().toLowerCase()
        else
          text = row.text().toLowerCase()

        matches = true

        for q in query
          matches &&= text.indexOf(q) >= 0

        row.toggle(matches)