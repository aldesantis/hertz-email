# frozen_string_literal: true

Hertz::Email.configure do |config|
  # Your base mailer class, for delivering notifications by email.
  config.base_mailer = '::ApplicationMailer'
end
