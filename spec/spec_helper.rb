$:.push File.expand_path("../lib", __FILE__)

require 'piratize'

RSpec.configure do |config|
  RESERVED_IVARS = %w(@loaded_fixtures)
  config.order = "random"
end