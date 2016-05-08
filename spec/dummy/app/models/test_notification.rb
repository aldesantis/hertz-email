class TestNotification < Hertz::Notification
  deliver_by :email

  def email_body
    'Test Notification'
  end
end
