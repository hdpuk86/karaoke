require('minitest/autorun')
require('minitest/rg')

require_relative('../room')
require_relative('../guest')
require_relative('../playlist')
require_relative('../song')

class TestPlaylist < MiniTest::Test

  def setup
    @guest1 = Guest.new("Hayley", 100, @song2)
    @guest2 = Guest.new("Bob", 20, @song4)
    @guest3 = Guest.new("Harry", 500, @song5)

    @guests = [@guest1, @guest2]

    @song1 = Song.new("The Good Fight", "Gang of Youths")
    @song2 = Song.new("Sucker", "The Big Moon")
    @song3 = Song.new("Drive You Mad", "Amy Shark")

    playlist1 = [@song1, @song2, @song3]

    @playlist1 = Playlist.new(playlist1)

    @song4 = Song.new("Funeral", "Band of Horses")
    @song5 = Song.new("Waves", "Dean Lewis")
    @song6 = Song.new("Shes's a Riot", "The Jungle Giants")

    playlist2 = [@song4, @song5, @song6]

    @playlist2 = Playlist.new(playlist2)

    @room1 = Room.new(1, @playlist1, @guests, 10, 5)
    @room2 = Room.new(1, @playlist2, @guests, 2, 5)
  end

  def test_number()
    assert_equal(1, @room1.number())
  end

  def test_guests()
    assert_equal([@guest1, @guest2], @room1.guests())
  end

  def test_add_guest()
    @room1.add_guest(@guest3)
    assert_equal([@guest1, @guest2, @guest3], @room1.guests())
    assert_equal(495, @guest3.cash())
    assert_equal("Sorry, room full", @room2.add_guest(@guest3))
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
    assert_equal(95, @guest1.cash())
  end

end
