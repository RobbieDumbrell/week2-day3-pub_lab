require('minitest/autorun')
require ('minitest/rg')
require_relative('../pub.rb')

class TestPub < MiniTest::Test

  def setup
    @guinness = Drink.new("Guinness", 3, 5)
    @carlsberg = Drink.new("Carlsberg", 2, 3)
    @babycham = Drink.new("Babycham", 4, 9)

    @drinks = [@guinness, @carlsberg, @babycham]

    @pizza = Food.new("Pizza", 5, 5)
    @burger = Food.new("Burger", 4, 7)
    @lobster = Food.new("Lobster", 10, 4)

    @food = [@pizza, @burger, @lobster]

    @stock = {
      @guinness => 2,
      @babycham => 100
      # @carlsberg => 0
    }

    @nags_head = Pub.new("Nag's Head", 50, @drinks, @food, @stock)


    @mark = Customer.new("Mark", 10, 17, 50)
    @robbie = Customer.new("Robbie", 1000, 25, 0)
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

  def test_pub_can_check_if__drunk
    @nags_head.check_if_drunk(@mark)
    is_drunk = @mark.drunkeness >=50
    assert_equal(true, is_drunk)
  end

  def test_sell_food_increases_till
    @nags_head.sell_food(@pizza)
    assert_equal(55, @nags_head.till)
  end

  def test_check_pub_has_stock
    assert_equal(@stock, @nags_head.stock)
  end

  def test_check_if_in_stock__true
    in_stock = @nags_head.check_if_in_stock(@guinness)
    assert_equal(true, in_stock)
  end

  def test_check_if_in_stock__false
    in_stock = @nags_head.check_if_in_stock(@carlsberg)
    assert_equal(false, in_stock)
  end


end
