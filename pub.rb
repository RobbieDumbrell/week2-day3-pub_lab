require_relative('drink.rb')
require_relative('customer.rb')
require_relative('food.rb')


class Pub

  attr_reader :name, :till, :drinks, :food

  def initialize(name, till, drinks, food)
    @name = name # this will be a string
    @till = till # this will be an integer
    @drinks = drinks # this will be an array
    @food = food # this will be an array
  end

  def sell_drink(drink)
    @till += drink.price # pub increaes its own till when it sells a drink. (customer will request this to happen).
  end

  def sell_food(food)
    @till += food.price
  end


  def check_if_legal(customer)
    return true if customer.age >= 18
    return false if customer.age < 18
  end

  def check_if_drunk(customer)
    return true if customer.drunkeness >=50
    return false if customer.drunkeness <50
  end

end
