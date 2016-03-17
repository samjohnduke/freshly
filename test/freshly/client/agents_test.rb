require 'test_helper'

class AgentsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_agents"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_agents"
  end

  def test_can_get_agents
    response = @client.agents
    refute_nil response
  end

  def test_can_get_agent
    response = @client.agent 9007933069
    refute_nil response
  end

  def test_can_get_me
    response = @client.me
    refute_nil response
  end

end
