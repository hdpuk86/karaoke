require('minitest/autorun')
require('minitest/rg')

require_relative('../bar')
require_relative('../drink')

class TestBar < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 3)
    @drink2 = Drink.new("Wine", 4)
    @drink3 = Drink.new("Cider", 2)
    @drink4 = Drink.new("Vodka", 2)
    @drink5 = Drink.new("Gin", 3)
    @drink6 = Drink.new("Cola", 1)

    @drinks_list = [@drink1, @drink2, @drink3, @drink4, @drink5]

    @bar = Bar.new(@drinks_list)
  end

  def test_drinks_list()
    assert_equal([@drink1, @drink2, @drink3, @drink4, @drink5], @bar.drinks_list())
  end

  def test_total_sales()
    assert_equal(0, @bar.total_sales())
  end

  def test_total_cash()
    assert_equal(0, @bar.total_cash())
  end

  def test_add_drink()
    @bar.add_drink(@drink6)
    assert_equal(6, @bar.drinks_list.length())
  end

  def test_remove_drink()
    @bar.remove_drink(@drink3)
    assert_equal(4, @bar.drinks_list.length())
  end

  def test_update_sales()
    @bar.update_sales(1)
    assert_equal(1, @bar.total_sales())
  end

  def test_update_cash()
    @bar.update_cash(4)
    assert_equal(4, @bar.total_cash())
  end

end
