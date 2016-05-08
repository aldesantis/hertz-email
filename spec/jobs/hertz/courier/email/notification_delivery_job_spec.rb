# frozen_string_literal: true
module Hertz
  module Courier
    module Email
      RSpec.describe NotificationDeliveryJob do
        let(:notification) { build_stubbed(:test_notification) }

        subject { described_class.new }

        context 'when the receiver has an email' do
          it 'delivers the notification by email'
        end

        context 'when the receiver does not have an email' do
          it 'does not deliver the notification by email'
        end
      end
    end
  end
end
