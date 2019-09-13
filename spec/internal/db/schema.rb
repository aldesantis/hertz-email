# frozen_string_literal: true

ActiveRecord::Schema.define do
  enable_extension :plpgsql
  enable_extension :hstore

  create_table :hertz_notifications, force: true do |t|
    t.string :type, null: false
    t.string :receiver_type, null: false
    t.integer :receiver_id, null: false
    t.hstore :meta,  default: {}, null: false
    t.datetime :read_at
    t.datetime :created_at, null: false
  end

  create_table :users, force: true do |t|
    t.string :email, null: false
  end
end
