$ -> $('.new-item-title').autocomplete 
  source: (request, response) -> $.getJSON "/items/#{ request.term }", (data) ->
    response data

    $('.ui-menu-item').html $('.ui-menu-item').text().replace(request.term, "<b>#{ request.term }</b>")
