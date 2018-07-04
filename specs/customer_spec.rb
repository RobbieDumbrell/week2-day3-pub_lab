require('minitest/autorun')
require ('minitest/rg')
require_relative('../customer.rb')

class TestCusomter < MiniTest::Test

  def setup
    @mark = Customer.new("Mark",10)

    @guinness = Drink.new("Guinness", 3)
    @carlsberg = Drink.new("Carlsberg", 2)
    @babycham = Drink.new("Babycham", 4)

    @drinks = [@guinness, @carlsberg, @babycham]

    @nags_head = Pub.new("Nag's Head", 50, @drinks)
  end

  def test_check_customer_name
    assert_equal("Mark", @mark.name)
  end

  def test_check_customer_wallet
    assert_equal(10, @mark.wallet)
  end

  def test_customer_can_buy_drink
    @mark.buy_drink(@babycham, @nags_head)
    assert_equal([@babycham], @mark.drinks_in_hand)
  end

  def test_wallet_decreases_when_customer_buys_drink
    @mark.buy_drink(@guinness, @nags_head)
    assert_equal(7, @mark.wallet)
  end

  def test_till_increases_when_customer_buys_drink
    @mark.buy_drink(@guinness, @nags_head)
    assert_equal(53, @nags_head.till)
  end

end
