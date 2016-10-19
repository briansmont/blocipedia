#store the environment variables on the Rails.config object

Rails.configuration.stripe = {
  :publishable_key  => Rails.application.secrets.stripe_publishable_key,
  :secret_key       => Rails.application.secrets.stripe_secret_key
}
#set the app-stored secret key with stripe
Stripe.api_key = Rails.application.secrets.stripe_secret_key