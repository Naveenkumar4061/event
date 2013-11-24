module Refinery
  module Events
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Events
      #isolate_namespace Refinery::Admin::Users

      engine_name :refinery_events
      engine_name :users

      initializer "register refinerycms_events plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "events"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.events_admin_events_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/events/event'
          }
          
        end
      end
      initializer "register refinerycms_users plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "users"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.refinery_admin_users_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/admin/users'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Events)
        #Refinery.register_extension(Refinery::Users)
      end
    end
  end
end
