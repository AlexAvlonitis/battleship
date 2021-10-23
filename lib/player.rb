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

  def place_ship(ship, row, col)
    board.place_ship(ship, row, col)
  end

  def attack(opponent, row, col)
    opponent.board.hit(row, col)
    render_boards(opponent)
  end

  def lost?
    board.fleet.all_sunk?
  end

  def render_boards(opponent)
    render_own_board(name, board.grid)
    render_opponents_board(opponent.name, opponent.board.grid)
  end
end
