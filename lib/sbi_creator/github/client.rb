require 'octokit'

module SbiCreator
  module Github
    module Client
      class << self
        def authorize(access_token)
          Octokit::Client.new(access_token: access_token)
        end
      end
    end
  end
end
