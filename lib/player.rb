class Player
  def self.build
    board = Board.build
    new(board)
  end

  def initialize(board)
    @board = board
  end

  def attack(opponent)
    input_coords = gets('enter coordinates x, y')
    opponent.board.hit!(input_coords)
  end

  def winner?
    false
  end
end
