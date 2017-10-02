require('minitest/autorun')
require('minitest/rg')

require_relative('../room')
require_relative('../guest')
require_relative('../playlist')
require_relative('../song')
require_relative('../bar')
require_relative('../drink')


class TestPlaylist < MiniTest::Test

  def setup
    @song1 = Song.new("The Good Fight", "Gang of Youths")
    @song2 = Song.new("Sucker", "The Big Moon")
    @song3 = Song.new("Drive You Mad", "Amy Shark")
    @song4 = Song.new("Funeral", "Band of Horses")
    @song5 = Song.new("Waves", "Dean Lewis")
    @song6 = Song.new("Shes's a Riot", "The Jungle Giants")

    playlist1 = [@song1, @song2, @song3]
    @playlist1 = Playlist.new(playlist1)

    playlist2 = [@song4, @song5, @song6]
    @playlist2 = Playlist.new(playlist2)

    @guest1 = Guest.new("Hayley", 100, @song1)
    @guest2 = Guest.new("Leo", 100, @song6)
    @guest3 = Guest.new("Harry", 500, @song5)
    @guest4 = Guest.new("Bob", 2, @song1)

    @guests = [@guest1, @guest2]

    @drink1 = Drink.new("Beer", 3)
    @drink2 = Drink.new("Wine", 4)
    @drink3 = Drink.new("Cider", 2)
    @drink4 = Drink.new("Vodka", 2)

    @drinks_list = [@drink1, @drink2, @drink3, @drink4]

    @bar1 = Bar.new(@drinks_list)
    @bar2 = Bar.new(@drinks_list)

    @room1 = Room.new(1, @playlist1, @guests, 10, 5, @bar1)
    @room2 = Room.new(1, @playlist2, @guests, 2, 5, @bar2)
  end

  def test_number()
    assert_equal(1, @room1.number())
  end

  def test_guests()
    assert_equal([@guest1, @guest2], @room1.guests())
  end

  def test_add_guest()
    @room1.add_guest(@guest3)
    assert_equal(3, @room1.guests.length())
    assert_equal(495, @guest3.cash())
    assert_equal("Sorry, that room is full", @room2.add_guest(@guest3))
    assert_equal("Leo is not enjoying the music", @room1.add_guest(@guest2))
  end

  def test_remove_guest()
    @room1.remove_guest(@guest1)
    assert_equal([@guest2], @room1.guests())
  end

  def test_show_playlist()
    assert_equal([@song1, @song2, @song3], @room1.show_playlist())
  end

  def test_change_playlist()
    @room1.change_playlist(@playlist2)
    assert_equal([@song4, @song5, @song6], @room1.show_playlist())
  end

  def test_count_guests()
    assert_equal(2, @room1.count_guests())
  end

  def test_charge_guest_entry()
    @room1.charge_guest_entry(@guest1)
    actual = @room1.charge_guest_entry(@guest4)
    assert_equal(95, @guest1.cash())
    assert_equal("Sorry Bob cannot afford to get in", actual)

  end

  def test_buy_drink()
    @room1.buy_drink(@guests[0], @bar1.drinks_list[0])
    @room1.buy_drink(@guest4, @bar1.drinks_list[1])
    assert_equal(1, @bar1.total_sales())
    assert_equal(3, @bar1.total_cash())
    assert_equal(97, @guest1.cash())
  end

  def test_like_music()
    actual = @room1.like_music(@guest1)
    expected = "Hayley loves the music"
    assert_equal(expected, actual)
  end

  # def test_like_music()
  #   actual = @room1.like_music(@guest4)
  #   assert_equal("Woo!", actual)
  # end

end
