$ -> $('.new-item-title').autocomplete
  source: (request, response) -> $.getJSON "/items/#{ request.term }", (data) ->
    response data.slice(0, 10)

    $('.ui-menu-item').html $('.ui-menu-item').text().replace(request.term, "<b>#{ request.term }</b>")
