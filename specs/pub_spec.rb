require('minitest/autorun')
require ('minitest/rg')
require_relative('../pub.rb')

class TestPub < MiniTest::Test

  def setup
    @guinness = Drink.new("Guinness", 3)
    @carlsberg = Drink.new("Carlsberg", 2)
    @babycham = Drink.new("Babycham", 4)

    @drinks = [@guinness, @carlsberg, @babycham]

    @nags_head = Pub.new("Nag's Head", 50, @drinks)

    @mark = Customer.new("Mark", 10, 17)
    @robbie = Customer.new("Robbie", 1000, 25)
  end

  def test_check_pub_name
    assert_equal("Nag's Head", @nags_head.name)
  end

  def test_check_pub_till
    assert_equal(50, @nags_head.till)
  end

  def test_check_pub_has_drinks
    expected_drinks = [@guinness, @carlsberg, @babycham]
    assert_equal(expected_drinks, @nags_head.drinks)
  end

  def test_sell_drink_increases_till
    @nags_head.sell_drink(@guinness)
    assert_equal(53, @nags_head.till)
  end

  def test_pub_can_check_if_legal__false
    @nags_head.check_if_legal(@mark)
    is_legal = @mark.age >= 18
    assert_equal(false, is_legal)
  end

  def test_pub_can_check_if_legal__true
    @nags_head.check_if_legal(@robbie)
    is_legal = @robbie.age >= 18
    assert_equal(true, is_legal)
  end

end
