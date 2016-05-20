require 'kramdown'
require 'pry'

module SbiCreator
  class Parser
    # TODO_REGEX = /\-[ ]+\[[x ]{1}\][ ]+(.+)/

    def initialize(pbi_num, comment)
      @pbi_num = pbi_num
      @kram_obj = Kramdown::Document.new(comment).root.children
    end

    # [SbiCreator::Sbi.new(title, body), SbiCreator::Sbi.new(title, body)]
    def parse_todo
      return unless todo_comment?

      list_obj = @kram_obj.detect {|obj| obj.type == :ul }.children
      # list_obj.first.children[0].children[0].value.chomp
      list_obj.each do |obj|
        title = "##{@pbi_num} #{remove_checkbox(obj.children[0].children[0].value).chomp}"
        body = parse_body(obj)
      end
      # todos = []
      # @lines.each do |line|
      #   if line.match(TODO_REGEX)
      #     todos << $1
      #   end
      # end
      # todos
    end

    private

    def todo_comment?
      first_line_txt = @kram_obj[0].children[0].value
      first_line_txt.match(/todo/i)
    end

    def remove_checkbox(str)
      str.sub(/\[ \]/)
    end

    def parse_body(obj)

    end
  end
end
