module Renderer
  def render_own_board(name, grid)
    render_instructions
    puts "Own board (#{name})"
    result = ''
    grid.each do |row|
      row.each do |cell|
        result += "| #{ cell.ship? ? ship_abbr(cell) : cell.state } |"
      end
      result += "\n"
    end
    puts result
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

  private

  def ship_abbr(cell)
    cell.ship.name.slice(0..1)
  end

  def render_instructions
    puts "===================="
    puts "Hit and miss: 'xx'"
    puts "Successful hit: 'oo'"
    puts "Empty cell: '--'"
    puts "===================="
  end
end
