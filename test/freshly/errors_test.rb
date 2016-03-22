require 'test_helper'

class ErrorsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_errors"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_errors"
  end

  def test_handles_404_errors
    err = assert_raises (Freshly::NotFound) { @client.ticket 333 }
    assert_equal err.message, "something went wrong"
  end

end
