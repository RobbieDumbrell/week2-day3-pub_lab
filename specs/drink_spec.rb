require('minitest/autorun')
require ('minitest/rg')
require_relative('../drink.rb')

class TestDrink < MiniTest::Test

  def setup
    @guinness = Drink.new("Guinness", 3, 5)
  end

  def test_check_drink_name
    assert_equal("Guinness", @guinness.name)
  end

  def test_check_drink_price
    assert_equal(3, @guinness.price)
  end

  def test_check_alcohol_level
    assert_equal(5, @guinness.alcohol_level)
  end

end
