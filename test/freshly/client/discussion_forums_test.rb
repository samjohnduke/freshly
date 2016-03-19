require 'test_helper'

class DiscussionCategoriesTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_discussion_categories"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_discussion_categories"
  end

end
