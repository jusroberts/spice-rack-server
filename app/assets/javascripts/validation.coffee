$ ->
  $('form').on 'submit', (e) ->
    for requiredField in $(@).find '[required]'
      $requiredField = $ requiredField

      if $requiredField.val() is ''
        e.preventDefault()

        $requiredField.trigger 'focus'

        return

      if $requiredField.attr('type') is 'password' and $requiredField.val().length < 8
        e.preventDefault()

        alert 'Your password needs to be at least 8 characters.'

        $requiredField.trigger 'focus'

        return
