# frozen_string_literal: true

RSpec.describe Hertz::Email::NotificationDeliveryJob do
  subject { described_class.new }

  let(:notification) { build_stubbed(:test_notification) }

  before do
    allow(notification).to receive(:delivered_with?)
      .with(:email)
      .and_return(false)

    allow(notification).to receive(:mark_delivered_with)
      .with(:email)
  end

  it 'delivers the notification by email' do
    expect {
      subject.perform(notification)
    }.to change(ActionMailer::Base.deliveries, :count).by(1)
  end

  it 'marks the notification as delivered by email' do
    expect(notification).to receive(:mark_delivered_with)
      .with(:email)
      .once

    subject.perform(notification)
  end

  context 'when the receiver does not have an email' do
    before do
      allow(notification.receiver).to receive(:hertz_email)
        .and_return(false)
    end

    it 'does not deliver the notification by email' do
      expect {
        subject.perform(notification)
      }.not_to change(ActionMailer::Base.deliveries, :count)
    end
  end

  context 'when the notification was already delivered by email' do
    before do
      allow(notification).to receive(:delivered_with?)
        .with(:email)
        .and_return(true)
    end

    it 'does not deliver the notification by email' do
      expect {
        subject.perform(notification)
      }.not_to change(ActionMailer::Base.deliveries, :count)
    end
  end
end
