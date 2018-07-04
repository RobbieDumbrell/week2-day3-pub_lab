require('minitest/autorun')
require ('minitest/rg')
require_relative('../customer.rb')

class TestCusomter < MiniTest::Test

  def setup
    @mark = Customer.new("mark",10)
  end

  def test_check_customer_name
    assert_equal("mark", @mark.name)
  end
  
  def test_check_customer_wallet
    assert_equal(10, @mark.wallet)
  end

end
