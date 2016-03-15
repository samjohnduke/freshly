require 'test_helper'

class ClientTest < Minitest::Test

  def test_it_works
    client = Freshly::Client.new
    refute_nil client
    assert_kind_of Freshly::Client, client
  end

end
