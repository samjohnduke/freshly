require 'test_helper'

class ClientTest < Minitest::Test

  def test_it_works
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

end
