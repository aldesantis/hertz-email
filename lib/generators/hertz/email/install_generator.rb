# frozen_string_literal: true

module Hertz
  module Email
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_initializer_file
        copy_file 'initializer.rb', 'config/initializers/hertz_email.rb'
      end
    end
  end
end
