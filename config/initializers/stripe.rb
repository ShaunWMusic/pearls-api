Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_TEST_KEY'],
  :secret_key      => ENV['SECRET_TEST_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
