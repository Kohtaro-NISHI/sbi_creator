require 'sbi_creator'
require 'sbi_creator/todos'
require 'sbi_creator/github/client'

module SbiCreator
  module Github
    class << self
      def config
        @config ||= SbiCreator::configuration
      end

      def auth
        @authentication ||= SbiCreator::Github::Client.authorize
      end

      def repo_id
        auth.repo(config.repo).id
      end

      def comments(issue_num)
        auth.issue_comments(config.repo, issue_num).map(&:body)
      end

      def create_sbi(issue_num)
        comments(issue_num).each do |comment|
          todos = SbiCreator::Parser.new(issue_num, comment).parse_todos
          next if todos.blank?
          todos.each {|todo| create_issue(todo) }
        end
      end

      def craete_issue(todo)
        auth.create_issue(config.repo, todo.title, todo.body)
      end
    end
  end
end
