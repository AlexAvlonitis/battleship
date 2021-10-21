class Ship
  DIRECTIONS = [:vertical, :horizontal].freeze

  attr_reader :size, :name

  def initialize(size, name, direction = nil)
    @size = size
    @name = name
    @lives = size
    @direction = direction || DIRECTIONS.sample
  end

  def hit!
    fail('Ship has already been sunk') if sunk?

    @lives -= 1
  end

  def sunk?
    @lives.zero?
  end

  def vertical?
    direction == :vertical
  end

  def horizontal?
    direction == :horizontal
  end

  private

  attr_reader :direction
end
