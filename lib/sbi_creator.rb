require 'sbi_creator/configuration'

module SbiCreator
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configure ||= SbiCreator::Configuration.new
    end
  end
end
