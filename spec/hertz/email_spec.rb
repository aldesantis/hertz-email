# frozen_string_literal: true

RSpec.describe Hertz::Email do
  describe '.deliver_notification' do
    let(:notification) { build_stubbed(:test_notification) }

    it 'schedules the delivery' do
      expect {
        described_class.deliver_notification(notification)
      }.to enqueue_a(described_class::NotificationDeliveryJob)
        .with(global_id(notification))
    end
  end
end
