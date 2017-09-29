class Room

  attr_reader :number
  attr_accessor :space, :entry_fee

  def initialize(number, playlist, guests, space, entry_fee)
    @number = number
    @playlist = playlist
    @guests = guests
    @space = space
    @entry_fee = entry_fee
    @entry_cash_total = 0
  end

  def guests()
    return @guests
  end

  def add_guest(new_guest)
    if @guests.length() < @space
      charge_guest_entry(new_guest)
      @guests << new_guest
    elsif @guests.length() >= @space
      return "Sorry, room full"
    end
  end

  def charge_guest_entry(guest)
    guest.take_cash(@entry_fee)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def show_playlist()
    return @playlist.playlist()
  end

  def change_playlist(new_playlist)
    @playlist = new_playlist
  end

  def count_guests()
    return @guests.length()
  end

  # def music_fan?(guest)
  #   for song in @playlist
  #     if song == guest.fave_song
  #       return "Whoop!"
  #     end
  #   end
  # end

  def music_fan(guest)
    song = guest.fave_song()
    if @playlist.find_song(song) == true
      return "Whoop!"
    else
      return ":("
    end
  end

end
