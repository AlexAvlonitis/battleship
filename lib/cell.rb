class Cell
  STATES = {
    miss: 'x',
    hit: 'o',
    empty: '-'
  }

  attr_accessor :ship
  attr_reader :state

  def initialize
    @state = STATES[:empty]
    @ship  = nil
  end

  def empty?
    @state == STATES[:empty]
  end

  def hit?
    @state == STATES[:hit]
  end

  def miss!
    @state = STATES[:miss]
  end

  def miss?
    @state == STATES[:miss]
  end

  def hit!
    if ship?
      @state = STATES[:hit]
      @ship.hit!
    else
      @state = STATES[:miss]
    end
  end

  def ship?
    !!(ship)
  end
end
