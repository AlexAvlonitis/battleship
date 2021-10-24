require_relative 'player'

class Game
  PLAYERS_LIMIT = 2

  attr_reader :players

  def initialize
    @players = []
  end

  def add_player(player)
    return puts 'players limit reached, start game.' if enough_players?

    @players << player
    puts "player added #{players[-1]}"
  end

  def next_player
    players[0]
  end

  def enough_players?
    PLAYERS_LIMIT == players.count
  end

  def any_loser?
    players.any?(&:lost?)
  end

  def next_turn!
    players.reverse!
  end

  def winner
    players.reject(&:lost?)[0].name
  end

  def opponent
    players[-1]
  end
end
