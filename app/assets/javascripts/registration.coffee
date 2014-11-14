$ ->
  switchForm = (formSelector) ->
    $('input[type="email"]').val $('input[type="email"]:visible').val()
    $('input[name="user[password]"]').val $('input[name="user[password]"]:visible').val()

    $('form').hide()
    $(formSelector).show()

  validateCredentials = (e, callback, validatePassword = true) ->
    if $('input[name="user[email]"]:visible').val() is ''
      $('input[name="user[email]"]:visible').trigger 'focus'

      e.preventDefault()

      return

    if validatePassword and $('input[name="user[password]"]:visible').val() is ''
      $('input[name="user[password]"]:visible').trigger 'focus'

      e.preventDefault()
      
      return

    if validatePassword and $('input[name="user[password]"]:visible').val().length < 8
      alert 'Your password needs to be at least 8 characters.'

      $('input[name="user[password]"]:visible').trigger 'focus'

      e.preventDefault()
      
      return

    callback()

  $('#forgot').on 'click', ->
    switchForm '#forgot-form'

    $('#forgot-form').trigger 'submit'

  $('#forgot-form').on 'submit', (e) ->
      validateCredentials e, -> $('#forgot-email').val $('#email').val(), false

  $('#register').on 'click', ->
    switchForm '#registration-form'

    $('#registration-form').trigger 'submit'

  $('#registration-form').on 'submit', (e) ->
    validateCredentials e, -> $('#password-confirmation').val $('#password').val()
