require 'test_helper'

class FreshlyTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_tickets"
  end

  def teardown
    VCR.eject_cassette "test_tickets"
  end

  def test_that_it_has_a_version_number
    refute_nil ::Freshly::VERSION
  end

  def test_it_can_create_a_client
    client = Freshly::Client.new
    refute_nil client
    assert_kind_of Freshly::Client, client
  end

  def test_default_client_options
    client = Freshly::Client.new
    assert client.user_agent.include?("Freshly")
    assert client.auto_paginate == false
    assert client.per_page == 100
  end

  def test_can_set_client_options
    client = Freshly::Client.new api_key: '123', api_endpoint: 'https://api.freshdesk.com'
    assert_equal client.api_key, '123'
    assert_equal client.api_endpoint, 'https://api.freshdesk.com/api/v2'
  end

  def test_can_fetch_tickets
    client = Freshly::Client.new api_key: 'BDiqIYFzqeMMGCp9kzKl', api_endpoint: 'https://skylarklabs.freshdesk.com'
    response = client.tickets
    refute_nil response
    assert_kind_of Array, response
  end
end
