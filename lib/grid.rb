require 'forwardable'

class Grid
  include Enumerable
  extend Forwardable
  def_delegator :grid, :each

  def initialize(grid_size, cell_klass)
    @grid_size = grid_size
    @cell_klass = cell_klass
    @grid = initialize_grid
  end

  def place_ship_vertically(ship, y, x)
    boundaries_checks(ship, y, x)

    ship.size.times { |n| cell(y: y + n, x: x).ship = ship }
  end

  def place_ship_horizontally(ship, y, x)
    boundaries_checks(ship, y, x)

    ship.size.times { |n| cell(y: y, x: x + n).ship = ship }
  end

  def cell(y:, x:)
    grid[y][x]
  end

  private

  attr_reader :cell_klass, :grid_size, :grid

  # grid_size * grid_size
  def initialize_grid
    Array.new(grid_size) { Array.new(grid_size) { cell_klass.new } }
  end

  def boundaries_checks(ship, y, x)
    raise_out_of_bound_err(x, y) if !within_boundaries?(x, ship.size)
    raise_occupied_cell_err(x, y) if cells_occupied?(x, y, ship)
  end

  def raise_out_of_bound_err(x, y)
    fail("x: #{x}, y: #{y}, the ship will be out of boundaries")
  end

  def raise_occupied_cell_err(x, y)
    fail("x: #{x}, y: #{y}, the cells are occupied")
  end

  def within_boundaries?(coord, ship_size)
    (grid_size - coord) >= ship_size
  end

  def cells_occupied?(x, y, ship)
    result = []
    if ship.vertical?
      ship.size.times { |n| result << cell(y: y, x: x + n) }
    else
      ship.size.times { |n| result << cell(y: y + n, x: x) }
    end
    result.none?(&:empty?)
  end
end
