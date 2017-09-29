class Bar

  attr_reader :drinks_list
  attr_accessor :total_sales, :total_cash

  def initialize(drinks_list)
    @drinks_list = drinks_list
    @total_sales = 0
    @total_cash = 0
  end

  def add_drink(drink)
    @drinks_list.push(drink)
  end

  def remove_drink(drink)
    @drinks_list.delete(drink)
  end

  def update_sales(amount)
    @total_sales += amount
  end

  def update_cash(amount)
    @total_cash += amount
  end

end
