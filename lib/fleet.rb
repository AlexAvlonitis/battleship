require 'pry'

class Fleet
  def self.build
    new(build_fleet)
  end

  def self.build_fleet
    {
      carrier: [
        Ship.new(5, :carrier)
      ],
      battleship: [
        Ship.new(4, :battleship),
        Ship.new(4, :battleship)
      ],
      cruiser: [
        Ship.new(3, :cruiser),
        Ship.new(3, :cruiser),
        Ship.new(3, :cruiser)
      ],
      submarine: [
        Ship.new(3, :submarine),
        Ship.new(3, :submarine),
        Ship.new(3, :submarine),
        Ship.new(3, :submarine)
      ],
      destroyer: [
        Ship.new(2, :destroyer),
        Ship.new(2, :destroyer),
        Ship.new(2, :destroyer),
        Ship.new(2, :destroyer),
        Ship.new(2, :destroyer)
      ]
    }
  end

  def initialize(fleet, fleet_size = 15)
    @fleet = fleet
    @fleet_size = fleet_size
    @deployed = []
  end

  def to_battle(ship_name)
    ship = fleet[ship_name.to_sym].pop
    @deployed << ship
    ship
  end

  def all_deployed?
    fleet.all? { |name, group| group.empty? }
  end

  private

  attr_reader :fleet
end
