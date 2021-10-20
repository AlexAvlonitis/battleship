require 'board_coordinator'

class Board
  def self.build(grid_size = 10)
    board_coordinator = BoardCoordinator.new(grid_size, fleet)
    new(board_coordinator)
  end

  def self.fleet
    [
      Ship.new(5, :carrier),
      Ship.new(4, :battleship),
      Ship.new(4, :battleship),
      Ship.new(3, :cruiser),
      Ship.new(3, :cruiser),
      Ship.new(3, :cruiser),
      Ship.new(3, :submarine),
      Ship.new(3, :submarine),
      Ship.new(3, :submarine),
      Ship.new(3, :submarine),
      Ship.new(2, :destroyer),
      Ship.new(2, :destroyer),
      Ship.new(2, :destroyer),
      Ship.new(2, :destroyer),
      Ship.new(2, :destroyer),
    ]
  end

  def initialize(board_coordinator)
    @board_coordinator = board_coordinator

    randomize_fleet_position
  end

  delegate: grid, board_coordinator.grid

  private

  attr_reader :board_coordinator

  def randomize_fleet_position
    board_coordinator.randomize_fleet_position
  end
end
