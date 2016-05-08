# frozen_string_literal: true
require 'hertz'

require 'hertz/courier/email/engine'
require 'hertz/courier/email/version'

module Hertz
  module Courier
    module Email
      class << self
        def configure
          yield(self)
        end

        def deliver_notification(notification)
          Hertz::Courier::Email::NotificationDeliveryJob
            .perform_later(notification)
        end
      end
    end
  end
end
