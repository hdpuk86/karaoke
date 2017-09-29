require('minitest/autorun')
require('minitest/rg')

require_relative('../playlist')
require_relative('../song')

class TestPlaylist < MiniTest::Test

  def setup()
    @song1 = Song.new("Song1", "Bev")
    @song2 = Song.new("Song2", "Harry")
    @song3 = Song.new("Song3", "Mark")
    @song4 = Song.new("Song4", "Lisa")

    playlist = [@song1, @song2, @song3]

    @playlist = Playlist.new(playlist)
  end

  def test_playlist
    assert_equal([@song1, @song2, @song3], @playlist.playlist())
  end

  def test_add_song
    actual = @playlist.add_song(@song4)
    expected = [@song1, @song2, @song3, @song4]
    assert_equal(expected, actual)
  end

  def test_find_song()
    assert_equal(true, @playlist.find_song("Song1"))
    assert_equal(false, @playlist.find_song("Wrong"))
  end

  def test_delete_song()
    actual = @playlist.delete_song("Song2")
    expected = [@song1, @song3]
    assert_equal(expected, actual)
  end

end
