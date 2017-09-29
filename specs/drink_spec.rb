require('minitest/autorun')
require('minitest/rg')

require_relative('../drink')

class TestDrink < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 3)
  end

  def test_name()
    assert_equal("Beer", @drink1.name())
  end

  def test_price()
    assert_equal(3, @drink1.price())
  end

end
