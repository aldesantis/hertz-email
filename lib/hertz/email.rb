# frozen_string_literal: true

require 'hertz'

require 'hertz/email/engine'
require 'hertz/email/version'

module Hertz
  module Email
    class << self
      mattr_writer :base_mailer

      def base_mailer
        (@base_mailer || '::ApplicationMailer').constantize
      end

      def configure
        yield(self)
      end

      def deliver_notification(notification)
        Hertz::Email::NotificationDeliveryJob.perform_later(notification)
      end
    end
  end
end
