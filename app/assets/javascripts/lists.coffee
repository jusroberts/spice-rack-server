$ ->
  toggleCheckbox = (checkboxContainer) ->
    inStockCheckbox = checkboxContainer.find 'i'
    previousCheck = inStockCheckbox.attr('class').split(' ')[1]

    inStockCheckbox.attr('class', 'fa').addClass(inStockCheckbox.data().check).data 'check', previousCheck

  $('.in-stock input').val true

  $('.item-image').on 'click', -> $(@).siblings('.item-update').trigger 'click'

  $('.item-update').on 'click', (e) ->
    $this = $ @

    $this.parents('.item').toggleClass 'out'

    toggleCheckbox $this

    $this.find('form').trigger 'submit'

  $('.item-delete form').on 'click', (e) -> $(@).trigger 'submit'

  $('.new-item-in-stock').on 'click', ->
    $this = $ @
    inStockField = $this.parents('form').find '.in-stock input'

    if inStockField.val().toString() is 'true'
      inStockField.val 'false'
    else
      inStockField.val 'true'

    toggleCheckbox $this

  $('.add-new-item').on 'click', ->
    $this = $ @
    newItemForm = $this.parents 'form'
    newItemNameField = newItemForm.find 'input[type="text"]'

    if newItemNameField.val() isnt '' and 
      newItemForm.trigger 'submit'
    else
      alert 'Please type in a name for your item!'

      newItemNameField.trigger 'focus'
