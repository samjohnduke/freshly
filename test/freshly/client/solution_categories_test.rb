require 'test_helper'

class SolutionCategoriesTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_solution_categories"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_solution_categories"
  end

end
