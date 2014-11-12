$ ->
  $('#register').on 'click', -> $('#registration-form').trigger 'submit'

  validateCredentials = (callback, validatePassword = true) ->
    if $('#email').val() is ''
      alert 'Please enter an email address.'

      $('#email').trigger 'focus'

      e.preventDefault()

      return

    if validatePassword and $('#password').val() is ''
      alert 'Please enter a password.'

      $('#password').trigger 'focus'

      e.preventDefault()

      return

    if validatePassword and $('#password').val().length < 8
      alert 'Your password needs to be at least 8 characters.'

      $('#password').trigger 'focus'

      e.preventDefault()

      return

    callback()

  $('#sign-in').on 'click', ->
    validateCredentials ->
      $('#sign-in-email').val $('#email').val()
      $('#sign-in-password').val $('#password').val()
      $('#sign-in-form').trigger 'submit'

  $('#forgot').on 'click', ->
    validateCredentials ->
      $('#forgot-email').val $('#email').val()
      $('#forgot-form').trigger 'submit'
    , false

  $('#registration-form').on 'submit', (e) ->
    validateCredentials ->
      $('#password-confirmation').val $('#password').val()


