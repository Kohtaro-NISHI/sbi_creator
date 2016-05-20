require 'sbi_creator/configuration'
require 'sbi_creator/github'
require 'sbi_creator/zenhub/client'

module SbiCreator
  module Zenhub
    class << self
      def config
        @config ||= SbiCreator::configuration
      end

      def auth
        @authentication ||= SbiCreator::Zenhub::Client.authorize(config.access_token)
      end

      def issue_nums_by_pipeline(pipeline)
				pipeline_issues = auth.board_data(SbiCreator::Github.repo_id).body
				pipeline_issues['pipelines'].detect {|pl|
					pl['name'] == pipeline 
				}['issues'].map {|issue|
					issue['issue_number']
				}
      end
    end
  end
end
