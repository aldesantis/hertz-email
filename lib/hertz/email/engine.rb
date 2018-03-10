# frozen_string_literal: true

module Hertz
  module Email
    class Engine < ::Rails::Engine
      isolate_namespace Hertz::Email
    end
  end
end
