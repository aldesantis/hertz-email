# frozen_string_literal: true

class TestNotification < Hertz::Notification
  deliver_by :email

  def email_subject
    'Test Notification'
  end
end
