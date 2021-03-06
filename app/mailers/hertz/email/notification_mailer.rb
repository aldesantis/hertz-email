# frozen_string_literal: true

module Hertz
  module Email
    class NotificationMailer < Hertz::Email.base_mailer
      def notification_email(notification)
        @notification = notification
        mail email_options_for(notification)
      end

      private

      def email_options_for(notification)
        options = {
          to: notification.receiver.hertz_email,
          subject: notification.email_subject,
          template_name: view_for(notification)
        }

        if notification.respond_to?(:email_options)
          options = options.merge(notification.email_options)
        end

        options
      end

      def view_for(notification)
        if notification.respond_to?(:email_template)
          notification.email_template
        else
          notification.class.to_s.underscore
        end
      end
    end
  end
end
