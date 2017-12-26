require 'hanami/interactor'
require 'hanami/interactor/matcher'

RSpec.configure do |config|
  config.before :suite do
    Pathname.new(Dir.pwd).join("tmp").mkpath
  end

  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  config.warnings = false

  config.order = :random
  Kernel.srand config.seed
end
