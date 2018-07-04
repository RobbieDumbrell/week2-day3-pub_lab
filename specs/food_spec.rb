require('minitest/autorun')
require ('minitest/rg')
require_relative('../food.rb')

class TestFood < MiniTest::Test

  def setup
    @pizza = Food.new("Pizza", 5, 5)
  end

  def test_check_food_name
    assert_equal("Pizza", @pizza.name)
  end

  def test_check_food_price
    assert_equal(5, @pizza.price)
  end

  def test_check_food_rej_level
    assert_equal(5, @pizza.rejuvination_level)
  end


end
