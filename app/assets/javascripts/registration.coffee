$ ->
  $('#register').on 'click', -> $('#registration-form').trigger 'submit'


  $('#registration-form').on 'submit', (e) ->
    if $('#email').val() is ''
      alert 'Please enter your email address.'

      $('#email').trigger 'focus'

      e.preventDefault()

      return

    if $('#password').val() is ''
      alert 'Please enter a password.'

      $('#password').trigger 'focus'

      e.preventDefault()

      return

    $('#password-confirmation').val $('#password').val()


