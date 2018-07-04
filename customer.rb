require_relative('drink.rb')
require_relative('pub.rb')

class Customer

  attr_reader :name, :wallet, :drinks_in_hand, :age

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks_in_hand = []
  end

  def buy_drink(drink, pub) # buys certain drink from a certain pub.
    if pub.check_if_legal(self) == true
    @drinks_in_hand << drink # puts a drink in customer's hand (array).
    @wallet -= drink.price # customers wallet decreases by price of the drink.
    pub.sell_drink(drink) # calls method from Pub class that increases the till.
    else return
    end
  end

end
