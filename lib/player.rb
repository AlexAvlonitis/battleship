class Player
  def self.build
    board = Board.build
    new(board)
  end

  def initialize(board)
    @board = board
  end

  def start

  end
end
