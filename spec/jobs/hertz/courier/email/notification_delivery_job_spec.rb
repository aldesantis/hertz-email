# frozen_string_literal: true
module Hertz
  module Courier
    module Email
      RSpec.describe NotificationDeliveryJob do
        let(:notification) { build_stubbed(:test_notification) }

        subject { described_class.new }

        before(:each) do
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
          before(:each) do
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
          before(:each) do
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
    end
  end
end
