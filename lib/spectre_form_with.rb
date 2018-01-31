require_relative 'spectre_form_with/form_builder'
require_relative 'spectre_form_with/helper'

module SpectreFormWith
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include SpectreFormWith::Helper
end
