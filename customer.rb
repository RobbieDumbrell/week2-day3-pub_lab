# require_relative('drink.rb')
require_relative('pub.rb')
# require_relative('food.rb')

class Customer

  attr_reader :name, :wallet, :drinks_in_stomach, :age, :drunkeness, :food_in_stomach

  def initialize(name, wallet, age, drunkeness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
    @drinks_in_stomach = []
    @food_in_stomach = []
  end

  def buy_drink(drink, pub) # buys certain drink from a certain pub.
    if pub.check_if_legal(self) == true && pub.check_if_drunk(self) == false
      @drinks_in_stomach << drink # puts a drink in customer's hand (array).
      @wallet -= drink.price # customers wallet decreases by price of the drink.
      pub.sell_drink(drink) # calls method from Pub class that increases the till.
      @drunkeness += drink.alcohol_level # customer's drunkneness level increases by the alcohol level of the specified drink.
    else return
    end
  end

  def buy_food(food, pub)
    @food_in_stomach << food
    @wallet -= food.price
    pub.sell_food(food)
    @drunkeness -= food.rejuvination_level
  end

end
