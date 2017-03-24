# frozen_string_literal: true
module Hertz
  module Courier
    module Email
      RSpec.describe NotificationMailer do
        describe '.notification_email' do
          subject(:email) { described_class.notification_email(notification) }

          let(:notification) { build_stubbed(:test_notification) }

          it 'sends the email to the receiver' do
            expect(email.to).to eq([notification.receiver.email])
          end
        end
      end
    end
  end
end
