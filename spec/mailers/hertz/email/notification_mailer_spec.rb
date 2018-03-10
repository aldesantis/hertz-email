# frozen_string_literal: true

RSpec.describe Hertz::Email::NotificationMailer do
  describe '.notification_email' do
    subject(:email) { described_class.notification_email(notification) }

    let(:notification) { build_stubbed(:test_notification) }

    it 'sends the email to the receiver' do
      expect(email.to).to eq([notification.receiver.email])
    end

    context 'when the notification responds to #email_options' do
      before do
        notification.instance_eval do
          def email_options
            { reply_to: 'foo@example.com' }
          end
        end
      end

      it 'adds the options to the email' do
        expect(email.reply_to).to eq(['foo@example.com'])
      end
    end
  end
end
