class Board
  attr_reader :grid

  def self.build(grid_size = 10)
    new(fleet, grid_size)
  end

  def self.fleet
    {
      carrier: [Ship.new(5, :carrier)],
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

  def initialize(fleet, grid_size)
    @fleet = fleet
    @grid_size = grid_size
    @grid = initialize_grid
  end

  def place_ship(ship_name, y:, x:)
    ship = fleet[ship_name].pop
    fail('Add a different ship') unless ship

    place_ship_vertically(ship, y, x) if ship.vertical?
    place_ship_horizontally(ship, y, x) if ship.horizontal?
  end

  private

  attr_reader :grid_size, :fleet

  # grid_size * grid_size
  def initialize_grid
    Array.new(grid_size) { Array.new(grid_size) }
  end

  def place_ship_vertically(ship, y, x)
    raise_out_of_bound_err(x, y) if !within_boundaries?(y, ship.size)
    raise_occupied_cell_err(x, y) if cells_occupied_vertically?(x, y, ship.size)

    ship.size.times { |n| grid[y + n][x] = ship }
  end

  def place_ship_horizontally(ship, y, x)
    raise_out_of_bound_err(x ,y) if !within_boundaries?(x, ship.size)
    raise_occupied_cell_err(x, y) if cells_occupied_horizontally?(x, y, ship.size)

    ship.size.times { |n| grid[y][x + n] = ship }
  end

  def raise_out_of_bound_err(x, y)
    fail("x: #{x}, y: #{y}, the ship will be out of boundaries")
  end

  def raise_occupied_cell_err(x, y)
    fail("x: #{x}, y: #{y}, the cells are occupied")
  end

  def random_coords
    [rand(grid_size), rand(grid_size)]
  end

  def within_boundaries?(coord, ship_size)
    (grid_size - coord) >= ship_size
  end

  def cells_occupied_horizontally?(x, y, ship_size)
    result = []
    ship_size.times { |n| result << grid[x + n][y] }
    result.any?
  end

  def cells_occupied_vertically?(x, y, ship_size)
    result = []
    ship_size.times { |n| result << grid[x][y + n] }
    result.any?
  end
end
