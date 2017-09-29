require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test

  def setup()
    @song = Song.new("Waves", "Dean Lewis")
    @guest = Guest.new("Hayley", 100, @song)
  end

  def test_name()
    assert_equal("Hayley", @guest.name())
  end

  def test_cash()
    assert_equal(100, @guest.cash)
  end

  def test_fave_song()
    assert_equal(@song, @guest.fave_song())
  end

end
