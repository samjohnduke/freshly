require 'test_helper'

class TicketsTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_tickets"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_tickets"
  end

  def test_can_fetch_tickets
    response = @client.tickets
    refute_nil response
    assert_kind_of Array, response
  end

  def test_can_create_a_ticket
    ticket = {
      name: "Sam Duke",
      email: "sam@skylarklabs.com",
      subject: "testing the api",
      description: "I am testing the api",
      source: 2,
      status: 2,
      priority: 1
    }
    response = @client.create_ticket ticket
    refute_nil response
    assert_kind_of Hash, response
  end

  def test_can_get_a_ticket
    response = @client.ticket 4
    refute_nil response
    assert_kind_of Hash, response
  end

  def test_can_update_a_ticket
    ticket = {
      description: "I am an updated description"
    }

    response = @client.edit_ticket 4, ticket
    refute_nil response
    assert_kind_of Hash, response
    assert_equal response["description"], "I am an updated description"
  end

  def test_can_delete_a_ticket
    response = @client.delete_ticket 4
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end

  def test_can_restore_a_ticket
    response = @client.restore_ticket 4
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end

  def test_can_list_converstaions_of_a_ticket
    response = @client.ticket_converstaions 4
    refute_nil response
    assert_kind_of Array, response
    assert_equal response.length, 0
  end

  def test_can_list_all_ticket_fields
    response = @client.ticket_fields
    refute_nil response
    assert_kind_of Array, response
  end

  def test_can_list_all_time_entries
    response = @client.ticket_time_entries 4
    refute_nil response
    assert_kind_of Array, response
  end

end
