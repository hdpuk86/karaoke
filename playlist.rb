class Playlist

  attr_reader :playlist

  def initialize(playlist)
    @playlist = playlist
  end

  def add_song(song)
    @playlist << song
    return @playlist
  end

  def find_song(title)
    for song in @playlist
      if song.title == title
        return true
      end
    end
    return false
  end

  def delete_song(title)
    for song in @playlist
      if song.title == title
        @playlist.delete(song)
      end
    end
  end

end
