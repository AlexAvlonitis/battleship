class Fleet
  def initialize
    @deployed = []
  end

  def to_battle(ship)
    @deployed << ship
  end

  def all_sunk?
    deployed.all?(&:sunk?)
  end

  private

  attr_reader :deployed
end
