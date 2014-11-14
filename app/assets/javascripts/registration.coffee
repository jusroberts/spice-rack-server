$ ->
  switchForm = (formSelector) ->
    $('input[type="email"]').val $('input[type="email"]:visible').val()
    $('input[name="user[password]"]').val $('input[name="user[password]"]:visible').val()

    $('form').hide()
    $(formSelector).show()

  validateCredentials = (callback, validatePassword = true) ->
    if $('input[name="user[email]"]:visible').val() is ''
      $('input[name="user[email]"]:visible').trigger 'focus'

      return

    if validatePassword and $('input[name="user[password]"]:visible').val() is ''
      $('input[name="user[password]"]:visible').trigger 'focus'

      return

    if validatePassword and $('input[name="user[password]"]:visible').val().length < 8
      alert 'Your password needs to be at least 8 characters.'

      $('input[name="user[password]"]:visible').trigger 'focus'

      return

    callback()

  $('#sign-in').on 'click', (e) ->
    e.preventDefault()

    switchForm '#sign-in-form'

    validateCredentials ->
      $('#sign-in-email').val $('#email').val()
      $('#sign-in-password').val $('#password').val()
      $('#sign-in-form').trigger 'submit'

  $('#forgot').on 'click', (e) ->
    e.preventDefault()

    switchForm '#forgot-form'

    validateCredentials ->
      $('#forgot-email').val $('#email').val()
      $('#forgot-form').trigger 'submit'
    , false

  $('#register').on 'click', (e) ->
    e.preventDefault()

    switchForm '#registration-form'

    validateCredentials ->
      $('#password-confirmation').val $('#password').val()
      $('#registration-form').trigger 'submit'
