require_relative('drink.rb')
require_relative('customer.rb')
require_relative('food.rb')


class Pub

  attr_reader :name, :till, :drinks, :food, :stock

  def initialize(name, till, drinks, food, stock)
    @name = name # this will be a string
    @till = till # this will be an integer
    @drinks = drinks # this will be an array
    @food = food # this will be an array
    @stock = stock #this will be a hash
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

  def check_if_in_stock(drink)
    if @stock.has_key?(drink) == true
      return true if @stock[drink] > 0
      return false if @stock[drink] == 0
    else
      return false
    end
  end

end
