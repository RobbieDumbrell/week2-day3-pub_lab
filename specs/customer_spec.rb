require('minitest/autorun')
require ('minitest/rg')
require_relative('../customer.rb')

class TestCusomter < MiniTest::Test

  def setup
    @mark = Customer.new("Mark", 10, 17, 50)
    @robbie= Customer.new("Robbie", 1000, 25, 0)
    @little_jonny = Customer.new("Jonny", 500, 15, 5)
    @big_jonny = Customer.new("Jonny", 20, 50, 75)
    @medium_jonny = Customer.new("Jonny", 40, 16, 70)

    @guinness = Drink.new("Guinness", 3, 5)
    @carlsberg = Drink.new("Carlsberg", 2, 4)
    @babycham = Drink.new("Babycham", 4, 9)

    @drinks = [@guinness, @carlsberg, @babycham]

    @pizza = Food.new("Pizza", 5, 5)
    @burger = Food.new("Burger", 4, 7)
    @lobster = Food.new("Lobster", 10, 4)

    @food = [@pizza, @burger, @lobster]

    @nags_head = Pub.new("Nag's Head", 50, @drinks, @food)
  end

  def test_check_customer_name
    assert_equal("Mark", @mark.name)
  end

  def test_check_customer_wallet
    assert_equal(10, @mark.wallet)
  end

  def test_customer_can_buy_drink
    @robbie.buy_drink(@babycham, @nags_head)
    assert_equal([@babycham], @robbie.drinks_in_stomach)
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
    assert_equal([], @mark.drinks_in_stomach)
    assert_equal(10, @mark.wallet)
    assert_equal(50, @nags_head.till)
  end

  def test_pub_checks_age_before_selling__allowed
    @robbie.buy_drink(@guinness, @nags_head)
    assert_equal([@guinness], @robbie.drinks_in_stomach)
    assert_equal(997, @robbie.wallet)
    assert_equal(53, @nags_head.till)
  end

  def test_check_drunkeness
    assert_equal(50, @mark.drunkeness)
  end

  def test_check_drunkeness_increases_when_customer_buys_drink
    @robbie.buy_drink(@babycham, @nags_head)
    assert_equal(9, @robbie.drunkeness)
  end

  def test_check_if_customer_can_buy_drink_when__sober_old
    @robbie.buy_drink(@guinness, @nags_head)
    assert_equal([@guinness], @robbie.drinks_in_stomach)
    assert_equal(997, @robbie.wallet)
    assert_equal(53, @nags_head.till)
    assert_equal(5, @robbie.drunkeness)
  end

  def test_check_if_customer_can_not_buy_drink_when__sober_young
    @little_jonny.buy_drink(@guinness, @nags_head)
    assert_equal([], @little_jonny.drinks_in_stomach)
    assert_equal(500, @little_jonny.wallet)
    assert_equal(50, @nags_head.till)
    assert_equal(5, @little_jonny.drunkeness)
  end

  def test_check_if_customer_can_not_buy_drink_when__drunk_old
    @big_jonny.buy_drink(@guinness, @nags_head)
    assert_equal([], @big_jonny.drinks_in_stomach)
    assert_equal(20, @big_jonny.wallet)
    assert_equal(50, @nags_head.till)
    assert_equal(75, @big_jonny.drunkeness)
  end

  def test_check_if_customer_can_not_buy_drink_when__drunk_young
    @medium_jonny.buy_drink(@guinness, @nags_head)
    assert_equal([], @medium_jonny.drinks_in_stomach)
    assert_equal(40, @medium_jonny.wallet)
    assert_equal(50, @nags_head.till)
    assert_equal(70, @medium_jonny.drunkeness)
  end

  def test_customer_can_buy_food
    @mark.buy_food(@pizza, @nags_head)
    assert_equal([@pizza], @mark.food_in_stomach)
    assert_equal(5, @mark.wallet)
    assert_equal(55, @nags_head.till)
    assert_equal(45, @mark.drunkeness)
  end

end
