require 'test_helper'

class ContactsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_contacts"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_contacts"
  end

  def test_create_contact
    contact = {
      email: "tartarus.mail+t1@gmail.com",
      name: "sam"
    }

    response = @client.create_contact contact
    refute_nil response
    refute_nil response["id"]
  end

  def test_can_get_contact
    response = @client.contact 9007933069
    refute_nil response
    refute_nil response["id"]
  end

  def test_can_get_contacts
    response = @client.contacts
    refute_nil response
  end

  def test_can_update_contact
    contact = {
      name: "not sam"
    }

    response = @client.edit_contact 9007933069, contact
    refute_nil response
    assert_equal response["name"], "not sam"
  end

  def test_can_make_contact_an_agent
    response = @client.make_contact_agent 9007933069
    refute_nil response
    refute_nil response["agent"]
  end

  def test_can_delete_contact
    response = @client.delete_contact 9007948965
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end

  def test_can_get_contact_fields
    response = @client.contact_fields
    refute_nil response
    assert_operator response.length, :>, 0
  end

end
