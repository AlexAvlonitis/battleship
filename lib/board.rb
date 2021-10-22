require_relative 'cell'
require_relative 'ship'
require_relative 'fleet'
require_relative 'grid'

class Board
  attr_reader :grid, :fleet

  def self.build(grid_size = 10)
    grid = Grid.new(grid_size, Cell)
    new(Fleet.build, grid)
  end

  def initialize(fleet, grid)
    @fleet = fleet
    @grid = grid
  end

  def place_ship(ship_name, y, x, direction)
    ship = fleet.to_battle(ship_name, direction)
    empty_ship_err unless ship
    all_deployed_err if fleet.all_deployed?

    grid.place_ship_vertically(ship, y, x) if ship.vertical?
    grid.place_ship_horizontally(ship, y, x) if ship.horizontal?
  end

  def hit(y, x)
    cell = grid.cell(y: y, x: x)
    return cell.miss! if cell.empty? && !cell.ship?

    return cell_hit_message(x, y) if cell.hit?
    return cell_missed_message(x, y) if cell.miss?

    cell.hit!
  end

  private

  def all_deployed_err
    fail('All ships have been deployed')
  end

  def empty_ship_err
    fail('Add a different ship')
  end

  def cell_hit_message(x, y)
    puts("x: #{x}, y: #{y} has already been hit successfully, you lost your turn")
  end

  def cell_missed_message(x, y)
    puts("x: #{x}, y: #{y} has already been hit and missed, you lost your turn")
  end
end
