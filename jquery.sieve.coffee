###
Table Filtering and Search for jQuery
version: 0.1.0

Licensed under the MIT:
http://www.opensource.org/licenses/mit-license.php

Copyright 2013 Ryan McGeary
###
$ = jQuery
$.fn.sieve = (options) ->

  settings = $.extend({
    searchInput: null
    searchTemplate: "<div><label>Search: <input type='text'></label></div>"
    rowSelector: "tr:not(:has('th'))"
    cellSelector: "td"
  }, options)

  compact = (array) -> item for item in array when item

  this.each ->
    table = $(this)

    if !settings.searchInput
      searchBar = $(settings.searchTemplate)
      settings.searchInput = searchBar.find("input")
      table.before(searchBar)

    settings.searchInput.on "keyup", ->
      query = compact($(this).val().toLowerCase().split(/\s+/))
      rows = table.find(settings.rowSelector)

      rows.each ->
        row = $(this)
        cells = row.find(settings.cellSelector)
        text = cells.text().toLowerCase()

        matches = true

        for q in query
          matches &&= text.indexOf(q) >= 0

        row.toggle(matches)