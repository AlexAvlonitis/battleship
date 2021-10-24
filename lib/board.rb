require_relative 'cell'
require_relative 'ship'
require_relative 'fleet'
require_relative 'grid'
require 'drb'

class Board
  include DRb::DRbUndumped
  attr_reader :grid, :fleet

  def self.build(grid_size = 10)
    grid = Grid.new(grid_size, Cell)

    new(Fleet.new, grid)
  end

  def initialize(fleet, grid)
    @fleet = fleet
    @grid = grid
  end

  def place_ship(ship, row, col)
    fleet.to_battle(ship)

    grid.place_ship_vertically(ship, row, col) if ship.vertical?
    grid.place_ship_horizontally(ship, row, col) if ship.horizontal?
  end

  def hit(row, col)
    cell = grid.cell(row: row, col: col)
    return cell.miss! if cell.empty? && !cell.ship?

    return cell_hit_message(row, col) if cell.hit?
    return cell_missed_message(row, col) if cell.miss?

    cell.hit!
  end

  private

  def cell_hit_message(row, col)
    puts("row: #{row}, col: #{col} has already been hit successfully, you lost your turn")
  end

  def cell_missed_message(row, col)
    puts("row: #{row}, col: #{col} has already been hit and missed, you lost your turn")
  end
end
