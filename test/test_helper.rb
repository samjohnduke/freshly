$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'freshly'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.default_cassette_options = { :record => :new_episodes}

  c.filter_sensitive_data("<API_KEY>") do
    test_api_key
  end
end

def test_api_key
  ENV["FRESHLY_API_KEY"] || "X"
end
