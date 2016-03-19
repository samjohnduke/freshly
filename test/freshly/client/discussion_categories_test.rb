require 'test_helper'

class DiscussionCategoriesTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_discussion_categories"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_discussion_categories"
  end

  def test_can_create_category
    cat = {
      name: "test_api_category",
      description: 'testing the api'
    }

    response = @client.create_category cat
    refute_nil response
    assert_equal response["name"], "test_api_category"
    assert_equal response["description"], 'testing the api'
  end

end
