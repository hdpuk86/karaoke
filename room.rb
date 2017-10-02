class Room

  attr_reader :number
  attr_accessor :capacity, :entry_fee

  def initialize(number, playlist, guests, capacity, entry_fee, bar)
    @number = number
    @playlist = playlist
    @guests = guests
    @capacity = capacity
    @entry_fee = entry_fee
    @entry_cash_total = 0
    @bar = bar
  end

  def guests()
    return @guests
  end

  def add_guest(new_guest)
    if @guests.length() < @capacity
      charge_guest_entry(new_guest)
      @guests << new_guest
      like_music(new_guest)
    elsif @guests.length() >= @capacity
      return "Sorry, that room is full"
    end
  end

  def charge_guest_entry(guest)
    if guest.cash() < @entry_fee
      return "Sorry #{guest.name()} cannot afford to get in"
    else
      guest.take_cash(@entry_fee)
    end
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

  def buy_drink(guest, drink)
    if guest.cash() >= drink.price()
      @bar.update_cash(drink.price())
      @bar.update_sales(1)
      guest.take_cash(drink.price())
    else
      puts "Sorry #{guest.name()} cannot afford a #{drink.name()}"
    end
  end

  def like_music(guest)
    fave_song = guest.fave_song()
    find_song = @playlist.find_song(fave_song.title())
    if find_song == true
      return "#{guest.name()} loves the music"
    else
      return "#{guest.name()} is not enjoying the music"
    end
  end

  # def like_music(guest)
  #   fave_song = guest.fave_song()
  #   for song in @playlist.playlist()
  #     if song.title() == fave_song.title()
  #       return "Woo!"
  #     else
  #       return "This music sucks!"
  #     end
  #   end
  # end

end
