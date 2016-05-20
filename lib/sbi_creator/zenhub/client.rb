require 'zenhub_ruby'

module SbiCreator
  module Zenhub
    module Client
      class << self
        def authorize(zenhub_access_token)
          ZenhubRuby::Client.new(zenhub_access_token)
        end
      end
    end
  end
end
