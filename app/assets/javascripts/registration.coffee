$ ->
  showForgotPasswordForm = ->
    $('input[type="email"]').val $('input[type="email"]:visible').val()
    $('form, #show-forgot-form').hide()
    $('#forgot-form').show()

  $('#show-forgot-form').on 'click', showForgotPasswordForm
  $('#registration-form').on 'submit', -> $('#password-confirmation').val $('#password').val()
