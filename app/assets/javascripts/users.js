$(document).ready(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  //Watch for a form submission
  $("#form-submit-btn").click(function(event) {
    event.preventDefault();
    $('input[type=submit]').prop('disable', true);
    var error = false;

    if (!error) {
      Stripe.card.createToken({
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        exp_month: $('#card_month').val(),
        exp_year: $('#card_year').val()
      }, stripeResponseHandler);
    }
    return false;
  });

  function stripeResponseHandler(status, response) {
    var f = $("#new_user");
    var token = response.id;

    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
    f.get(0).submit();
  }
});
