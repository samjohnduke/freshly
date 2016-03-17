require 'test_helper'

class GroupsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_groups"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_groups"
  end

  def test_can_create_group
    response = @client.create_group :name => "test_group"
    refute_nil response
    assert_equal response["name"], "test_group"
  end

  def test_can_get_group
    response = @client.group 9000161529
    refute_nil response
    assert_equal response["name"], "test_group"
  end

  def test_can_get_groups
    response = @client.groups
    refute_nil response
    assert_equal response.length, 4
  end

  def test_can_edit_group
    response = @client.edit_group 9000161529, name: "test"
    refute_nil response
    assert_equal response["name"], "test"
  end

  def test_can_delete_group
    response = @client.delete_group 9000161529
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end

end
