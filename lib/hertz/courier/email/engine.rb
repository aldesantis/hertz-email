# frozen_string_literal: true
module Hertz
  module Courier
    module Email
      class Engine < ::Rails::Engine
        isolate_namespace Hertz::Courier::Email
      end
    end
  end
end
