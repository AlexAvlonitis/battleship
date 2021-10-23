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

  def place_ship_vertically(ship, row, col)
    boundaries_checks(ship, row, col)

    ship.size.times do |n|
      cell = cell(row: row + n, col: col)
      cell.ship = ship
    end
  end

  def place_ship_horizontally(ship, row, col)
    boundaries_checks(ship, row, col)

    ship.size.times do |n|
      cell = cell(row: row, col: col + n)
      cell.ship = ship
    end
  end

  def cell(row:, col:)
    grid[row][col]
  end

  private

  attr_reader :cell_klass, :grid_size, :grid

  # grid_size * grid_size
  def initialize_grid
    Array.new(grid_size) { Array.new(grid_size) { cell_klass.new } }
  end

  def boundaries_checks(ship, row, col)
    raise_out_of_bound_err(ship, row, col) if !within_boundaries?(row, col, ship)
    raise_occupied_cell_err(ship, row, col) if cells_occupied?(row, col, ship)
  end

  def raise_out_of_bound_err(ship, row, col)
    fail("#{ship.name}, row: #{row}, col: #{col}, the ship is out of boundaries")
  end

  def raise_occupied_cell_err(ship, row, col)
    fail("#{ship.name}, row: #{row}, col: #{col}, the cells are occupied")
  end

  def within_boundaries?(row, col, ship)
    coord  = ship.vertical? ? row : col

    (grid_size - coord) >= ship.size
  end

  def cells_occupied?(row, col, ship)
    result = []
    if ship.vertical?
      ship.size.times { |n| result << cell(row: row + n, col: col) }
    else
      ship.size.times { |n| result << cell(row: row, col: col + n) }
    end
    result.any?(&:ship?)
  end
end
