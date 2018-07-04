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

end
