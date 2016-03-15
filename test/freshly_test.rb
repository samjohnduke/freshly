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

end
