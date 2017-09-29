class Guest

  attr_reader :name
  attr_accessor :cash

  def initialize(name, cash, fave_song)
      @name = name
      @cash = cash
      @fave_song = fave_song
  end

  def take_cash(amount)
    @cash = @cash - amount
  end

  def fave_song()
    return @fave_song
  end

end
