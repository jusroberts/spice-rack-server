$ -> $('.new-item-title').autocomplete 
  source: (request, response) -> $.getJSON("/items/#{ request.term }", (data) -> response data)
