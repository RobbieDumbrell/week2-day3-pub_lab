require_relative('drink.rb')

class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name # this will be a string
    @till = till # this will be an integer
    @drinks = drinks # this will be an array
  end

end
