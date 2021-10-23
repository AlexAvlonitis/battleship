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
    until any_loser? do
      next_turn!
      next_player.attack(opponent, *input_coords)
    end
    puts "#{winner} won!"
  end

  private

  attr_reader :next_player

  def any_loser?
    [player, player2].any?(&:lost?)
  end

  def winner
    [player, player2].reject(&:lost?).first.name
  end

  def next_turn!
    @next_player = opponent
  end

  def input_coords
    puts "#{next_player.name}'s turn"
    print 'Enter row, col coordinates e.g 1,1: '
    coords = gets.chomp
    coords.split(',').map(&:to_i)
  end

  def opponent
    next_player == player ? player2 : player
  end
end
