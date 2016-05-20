require 'sbi_creator'
require 'spec_helper'
require 'sbi_creator/parser'

describe SbiCreator do
  it 'has a version number' do
    expect(SbiCreator::VERSION).not_to be nil
  end

  describe 'Configuration' do
    before do
      SbiCreator.configure do |config|
        config.access_token = 'access_token'
        # config.repo = 'tkm-kj/test_repo'
        config.zenhub_access_token = 'zenhub_access_token'
      end
    end

    it { expect(SbiCreator.configuration.repo).to be_nil }
  end

  describe 'foo' do
    let(:foo) do
      text =<<-MD
## TODO

- [ ] すること1
  - す1
  - す2
- [ ] やること1
  - や1
    - テスト
  - や2
MD
      SbiCreator::Parser.new(1, text)
    end

    it do
      expect(foo.parse_todo).to eq '[ ] すること1'
    end
  end
end
