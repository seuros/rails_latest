require "rails_latest/version"
require "rails"
module RailsLatest
  class Railtie < Rails::Railtie # :nodoc:
    initializer 'controller_filters' do
      AbstractController::Callbacks::ClassMethods.class_eval do
        [:before, :after, :around].each do |filter|
          alias_method "#{filter}_action", "#{filter}_filter"
          alias_method "prepend_#{filter}_action", "prepend_#{filter}_filter"
          alias_method "append_#{filter}_action", "append_#{filter}_filter"
          alias_method "skip_#{filter}_action", "skip_#{filter}_filter"
          ActiveSupport::Deprecation.deprecate_methods(self, "#{filter}_filter":   "use ##{filter}_action",
                                                       "prepend_#{filter}_filter": "use #prepend_#{filter}_action",
                                                       "append_#{filter}_filter":  "use #append_#{filter}_action",
                                                       "skip_#{filter}_filter":    "use #skip_#{filter}_action")
        end
      end
      ActionController::RequestForgeryProtection::ClassMethods.class_eval do
        redefine_method(:protect_from_forgery) do |options = {}|
          self.request_forgery_protection_token ||= :authenticity_token
          prepend_before_action :verify_authenticity_token, options
        end
      end
    end
  end
end
