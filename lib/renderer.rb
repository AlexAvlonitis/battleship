module Renderer
  def render_own_board(name, grid)
    render_instructions
    puts "My board (#{name})"
    build_text_board(grid) { |cell| render_state(cell) }
  end

  def render_opponents_board(name, grid)
    puts "Opponent's board (#{name})"
    build_text_board(grid) { |cell| cell.state }
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

  def build_text_board(grid)
    puts "-" * 41
    result = ''
    grid.each.with_index do |row, row_index|
      # print column numbers
      if row_index.zero?
        result += (0..row.size - 1).map { |n| "   #{n.to_s}" }.join
        result += "\n"
      end

      # print row numbers
      result += row_index.to_s

      row.each.with_index do |cell, cell_index|
        result += "|" if cell_index.zero?
        result += " #{yield(cell)} "
        result += "|"
      end
      result += "\n"
    end
    puts result
    puts
  end

  def render_state(cell)
    return cell.state if cell.ship? && cell.hit?
    return ship_abbr(cell) if cell.ship?

    cell.state
  end

  def ship_abbr(cell)
    cell.ship.name[0]
  end

  def render_instructions
    puts
    puts "###################"
    puts "Hit and miss: 'x'"
    puts "Successful hit: 'o'"
    puts "Empty cell: '-'"
    puts "###################"
    puts
  end
end
