class BoardCoordinator
  attr_reader :grid

  def initialize(grid_size, fleet)
    @grid_size = grid_size
    @grid = initialize_grid
    @fleet = fleet
  end

  def randomize_fleet_position
    until fleet.empty? do
      ship = fleet.shift
      place_ship(ship)
    end
  end

  private

  attr_reader :grid_size, :fleet

  # grid_size * grid_size
  def initialize_grid
    Array.new(grid_size) { Array.new(grid_size) }
  end

  def place_ship(ship)
    direction = random_direction
    x, y = random_coords

    place_ship_vertically(ship, x, y) if direction == :vertical
    place_ship_horizontally(ship, x, y) if direction == :horizontal
  end

  def random_direction
    %i[vertical horizontal].sample
  end

  def place_ship_vertically(ship, x, y)
    while !within_vertical_boundaries?(y, ship.size) ||
      cells_occupied_vertically?(x, y, ship.size)
      x, y = random_coords
    end

    ship.size.times { |n| grid[x][y + n] = ship }
  end

  def place_ship_horizontally(ship, x, y)
    while !within_horizontal_boundaries?(x, ship.size) ||
      cells_occupied_horizontally?(x, y, ship.size)
      x, y = random_coords
    end

    ship.size.times { |n| grid[x + n][y] = ship }
  end

  def random_coords
    [rand(grid_size), rand(grid_size)]
  end

  def within_vertical_boundaries?(y_position, ship_size)
    (grid_size - y_position) > ship_size
  end

  def within_horizontal_boundaries?(x_position, ship_size)
    (grid_size - x_position) > ship_size
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
