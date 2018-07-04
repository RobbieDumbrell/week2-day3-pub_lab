require('minitest/autorun')
require ('minitest/rg')
require_relative('../customer.rb')

class TestCusomter < MiniTest::Test

  def setup
    @mark = Customer.new("Mark", 10, 17)
    @robbie= Customer.new("Robbie", 1000, 25)

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
    @robbie.buy_drink(@babycham, @nags_head)
    assert_equal([@babycham], @robbie.drinks_in_hand)
  end

  def test_wallet_decreases_when_customer_buys_drink
    @robbie.buy_drink(@guinness, @nags_head)
    assert_equal(997, @robbie.wallet)
  end

  def test_till_increases_when_customer_buys_drink
    @robbie.buy_drink(@guinness, @nags_head)
    assert_equal(53, @nags_head.till)
  end

  def test_check_customer_age
    assert_equal(17, @mark.age)
  end

  def test_pub_checks_age_before_selling__not_allowed
    @mark.buy_drink(@guinness, @nags_head)
    assert_equal([], @mark.drinks_in_hand)
    assert_equal(10, @mark.wallet)
    assert_equal(50, @nags_head.till)
  end

  def test_pub_checks_age_before_selling__allowed
    @robbie.buy_drink(@guinness, @nags_head)
    assert_equal([@guinness], @robbie.drinks_in_hand)
    assert_equal(997, @robbie.wallet)
    assert_equal(53, @nags_head.till)
  end

end
