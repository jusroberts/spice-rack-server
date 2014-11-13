$ ->
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

    $('form').hide()
    $('#sign-in-form').show()

    validateCredentials ->
      $('#sign-in-email').val $('#email').val()
      $('#sign-in-password').val $('#password').val()
      $('#sign-in-form').trigger 'submit'

  $('#forgot').on 'click', (e) ->
    e.preventDefault()

    $('form').hide()
    $('#forgot-form').show()

    validateCredentials ->
      $('#forgot-email').val $('#email').val()
      $('#forgot-form').trigger 'submit'
    , false

  $('#register').on 'click', (e) ->
    e.preventDefault()

    $('form').hide()
    $('#registration-form').show()

    validateCredentials ->
      $('#password-confirmation').val $('#password').val()
      $('#registration-form').trigger 'submit'
