require 'test_helper'

class CompaniesTest < Minitest::Test

  def setup
    VCR.insert_cassette "test_companies"
    @client = Freshly::Client.new api_key: test_api_key, api_endpoint: 'https://skylarklabs.freshdesk.com'
  end

  def teardown
    VCR.eject_cassette "test_companies"
  end

  def test_can_create_company
    response = @client.create_company name: "test_company"
    refute_nil response
    assert_equal response["name"], "test_company"
  end

  def test_can_get_companies
    response = @client.companies
    refute_nil response
    assert_operator response.length, :>, 0
  end

  def test_can_get_company
    response = @client.company 9000308527
    refute_nil response
    assert_equal response["name"], "test_company"
  end

  def test_can_edit_company
    response = @client.edit_company 9000308527, name: 'test'
    refute_nil response
    assert_equal response["name"], "test"
  end

  def test_can_get_company_fields
    response = @client.company_fields
    refute_nil response
    assert_operator response.length, :>, 0
  end

  def test_can_delete_company
    response = @client.delete_company 9000308527
    assert_equal response, ""
    assert_equal @client.last_response.status, 204
  end

end
