# frozen_string_literal: true
FactoryGirl.define do
  factory :notification, class: 'Hertz::Notification' do
    association :receiver, factory: :user, strategy: :build

    factory :test_notification, class: 'TestNotification' do
    end
  end
end
