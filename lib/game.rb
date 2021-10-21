require_relative 'player'

class Game
  attr_reader :player, :player2

  def self.build
    player = Player.build
    player2 = Player.build
    new(player, player2)
  end

  def initialize(player, player2)
    @player = player
    @player2 = player2
    @next_player = player
  end

  def start
    until winner? do
      next_turn!
      y, x = input_coords
      next_player.attack(opponent, y, x)
    end
  end

  private

  attr_reader :next_player

  def winner?
    [player, player2].any?(&:lost?)
  end

  def next_turn!
    @next_player = opponent
  end

  def input_coords
    puts "#{next_player.name}'s turn"
    print 'Enter col, row coordinates e.g 1,1: '
    coords = gets.chomp
    coords.split(',').map(&:to_i)
  end

  def opponent
    next_player == player ? player2 : player
  end
end
