begin
  require 'ruby-growl'

  class ActionController::Base
    GROWL = Growl.new "localhost", "growl_error", ["growl_error"]
    def rescue_action_with_feature(exception)
      rescue_action_without_feature(exception)
      GROWL.notify "growl_error", exception.class.name, exception.message
    end

    alias_method_chain :rescue_action, :feature

  end
rescue LoadError => e
end
