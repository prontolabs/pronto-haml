require 'rspec'
require 'rspec/its'
require 'pronto/haml'

RSpec.shared_context 'test repo' do
  let(:dot_git) { 'spec/fixtures/test.git/.git' }
  let(:git) { 'spec/fixtures/test.git/git' }
  let(:repo) { Pronto::Git::Repository.new('spec/fixtures/test.git') }

  around do |example|
    FileUtils.mv(git, dot_git)
    example.run
    FileUtils.mv(dot_git, git)
  end
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }
end
