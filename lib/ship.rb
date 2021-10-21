class Ship
  DIRECTIONS = [:vertical, :horizontal].freeze

  attr_reader :size, :name

  def initialize(size, name, direction = nil)
    @size = size
    @name = name
    @hit_times = size
    @direction = direction || DIRECTIONS.sample
  end

  def hit!
    fail('Ship has already been sunk') if @hit_times.zero?

    @hit_times += 1
  end

  def sunk?
    @hit_times.zero?
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
