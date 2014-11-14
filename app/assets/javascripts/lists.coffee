$ ->
  toggleCheckbox = (checkboxContainer) ->
    inStockCheckbox = checkboxContainer.find 'i'
    previousCheck = inStockCheckbox.attr('class').split(' ')[1]

    inStockCheckbox.attr('class', 'fa').addClass(inStockCheckbox.data().check).data 'check', previousCheck

  $('.in-stock input').val true

  $('.list-items').on 'click', '.item.selected .item-image', ->
    $this = $ @

    $this.parents('.item').removeClass('selected').toggleClass 'out'

    toggleCheckbox $this.siblings '.item-update'

    $this.siblings('.item-update').find('form').trigger 'submit'

  $('.list-items').on 'click', '.item.selected .item-update', (e) ->
    $this = $ @

    $this.parents('.item').removeClass('selected').toggleClass 'out'

    toggleCheckbox $this

    $this.find('form').trigger 'submit'

  $('.list-items').on 'click', '.item', ->
    $('.item').removeClass 'selected'
    $(@).toggleClass 'selected'

  $('.list-delete').on 'click', -> $(@).trigger 'submit' if confirm 'Are you sure you wish to delete this?'
  $('.item-delete form').on 'click', -> $(@).trigger 'submit'

  $('.new-item-in-stock').on 'click', ->
    $this = $ @
    inStockField = $this.parents('form').find '.in-stock input'

    if inStockField.val().toString() is 'true'
      inStockField.val 'false'
    else
      inStockField.val 'true'

    toggleCheckbox $this

  $('.add-new-item, .add-new-list').on 'click', ->
    $this = $ @
    newItemForm = $this.parents 'form'
    newItemNameField = newItemForm.find 'input[type="text"]'

    if newItemNameField.val() isnt '' and 
      newItemForm.trigger 'submit'
    else
      newItemNameField.trigger 'focus'

  $('#all').on 'click', -> $('.item').show()
  $('#in-stock').on 'click', -> $('.item').hide().not('.out').show()
  $('#out-of-stock').on 'click', -> $('.item').hide().filter('.out').show()
