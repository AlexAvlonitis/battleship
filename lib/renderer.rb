module Renderer
  def render_own_board(grid)
    puts 'Own board'
    result = ''
    grid.each do |row|
      row.each do |cel|
        result += "| #{cel.to_s} |"
      end
      result += "\n"
    end
    puts result
  end

  def render_opponents_board(grid)
    puts 'Opponent\'s board'
    result = ''
    grid.each do |row|
      row.each do |cel|
        result += "| #{cel.to_s} |"
      end
      result += "\n"
    end
    puts result
  end
end
