$ -> $('.new-item-title').autocomplete
  source: (request, response) -> $.getJSON "/items/#{ request.term }", (data) ->
    response data.slice(0, 10)

    for uiMenuItem in $ '.ui-menu-item'
      $(uiMenuItem).html $(uiMenuItem).text().replace(request.term, "<b>#{ request.term }</b>")
