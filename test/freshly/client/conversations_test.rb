require 'test_helper'

class ConversationsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_conversations"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_conversations"
  end

  def test_can_create_reply
    conv = {
      body: "this is a test reply to a test conversation",
    }
    response = @client.create_reply 4, conv
    refute_nil response
    assert_kind_of Hash, response
    assert_equal response["body"], "this is a test reply to a test conversation"
  end

  def test_can_create_note
    conv = {
      body: "this is a test note on a ticket",
    }
    response = @client.create_note 4, conv
    refute_nil response
    assert_kind_of Hash, response
    assert_equal response["body"],"this is a test note on a ticket"
  end

  def test_can_edit_converstaion
    conv = {
      body: "updated note body"
    }
    response = @client.edit_conversation 9006506040, conv
    refute_nil response
    assert_kind_of Hash, response
    assert_equal response["body"], "updated note body"
  end

  def test_can_delete_conversation
    response = @client.delete_conversation 9006506040
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end
end
