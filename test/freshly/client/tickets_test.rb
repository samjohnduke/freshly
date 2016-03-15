require 'test_helper'

class TicketsTest < Minitest::Test
  
  def setup
    VCR.insert_cassette "test_tickets"
  end

  def teardown
    VCR.eject_cassette "test_tickets"
  end

  def test_can_fetch_tickets
    client = Freshly::Client.new api_key: 'BDiqIYFzqeMMGCp9kzKl', api_endpoint: 'https://skylarklabs.freshdesk.com'
    response = client.tickets
    refute_nil response
    assert_kind_of Array, response
  end

end
