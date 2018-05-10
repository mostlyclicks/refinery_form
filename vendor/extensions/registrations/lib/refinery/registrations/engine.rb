module Refinery
  module Registrations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Registrations

      engine_name :refinery_registrations

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "registrations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.registrations_admin_registrations_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Registrations)
      end
    end
  end
end
