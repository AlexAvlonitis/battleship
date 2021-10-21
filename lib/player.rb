require_relative 'board'
require_relative 'renderer'

class Player
  include Renderer

  attr_reader :board
  attr_accessor :name

  def self.build
    board = Board.build
    new(board, 'Tester')
  end

  def initialize(board, name)
    @board = board
    @name = name
  end

  def place_ship(ship_name, y, x)
    board.place_ship(ship_name, y, x)
  end

  def attack(opponent, y, x)
    opponent.board.hit(y, x)
    render_own_board(board.grid)
    render_opponents_board(opponent.board.grid)
  end

  def lost?
    false
  end
end
