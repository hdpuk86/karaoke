require('minitest/autorun')
require('minitest/rg')

require_relative('../song')

class TestSong < MiniTest::Test

  def setup()
    @song1 = Song.new("song title", "artist")
  end

  def test_song_title()
    actual = @song1.title()
    expected = "song title"
    assert_equal(expected, actual)
  end

  def test_song_artist()
    assert_equal("artist", @song1.artist())
  end

end
