$ -> 
  $('.item-update form').on 'click', (e) ->
    $this = $ @

    $this.parents('.item').toggleClass 'out'

    faIcon = $this.find 'i'

    faIcon.attr('class', 'fa').addClass "fa-#{ faIcon.data().switch }"

    $this.trigger 'submit'

  $('.item-delete form').on 'click', (e) -> $(@).trigger 'submit'
