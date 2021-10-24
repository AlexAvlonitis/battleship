module Renderer
  def render_own_board(name, grid)
    render_instructions
    puts "Own board (#{name})"
    result = ''
    grid.each do |row|
      row.each do |cell|
        result += "| #{render_state(cell)} |"
      end
      result += "\n"
    end
    puts result
    puts
  end

  def render_opponents_board(name, grid)
    puts "Opponent's board (#{name})"
    result = ''
    grid.each do |row|
      row.each do |cell|
        result += "| #{cell.state} |"
      end
      result += "\n"
    end
    puts result
  end

  def enter_coords_text(name)
    puts "\n#{name}'s turn"
    print 'Enter row, col coordinates e.g 1,1: '
  end

  def you_won
    "YOU WON :)"
  end

  def you_lost
    "YOU LOST :("
  end

  private

  def render_state(cell)
    return cell.state if cell.ship? && cell.hit?
    return ship_abbr(cell) if cell.ship?

    cell.state
  end

  def ship_abbr(cell)
    cell.ship.name.slice(0..1)
  end

  def render_instructions
    puts
    puts "===================="
    puts "Hit and miss: 'xx'"
    puts "Successful hit: 'oo'"
    puts "Empty cell: '--'"
    puts "===================="
    puts
  end
end
