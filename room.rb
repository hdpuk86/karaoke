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
    elsif @guests.length() >= @capacity
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

  def buy_drink(guest, drink)
    @bar.update_cash(drink.price())
    @bar.update_sales(1)
    guest.take_cash(drink.price())
  end

end
