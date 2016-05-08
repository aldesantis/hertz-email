# frozen_string_literal: true
module Hertz
  module Courier
    module Email
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)

        def copy_initializer_file
          copy_file 'initializer.rb', 'config/initializers/hertz_email.rb'
        end
      end
    end
  end
end
