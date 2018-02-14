# frozen_string_literal: true

module Hertz
  module Courier
    module Email
      class NotificationDeliveryJob < ActiveJob::Base
        queue_as :default

        def perform(notification)
          return unless notification.receiver.hertz_email.present?
          return if notification.delivered_with?(:email)

          Hertz::Courier::Email::NotificationMailer.notification_email(notification).deliver_now

          notification.mark_delivered_with(:email)
        end
      end
    end
  end
end
