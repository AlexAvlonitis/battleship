class Game
  def self.build
    player = Player.build
    player2 = Player.build
  end

  def initialize(player, player2)
    @player = player
    @player2 = player2
    @next_player = player
  end

  def start
    until winner? do
      next_turn!
      next_player.attack(opponent)
    end
  end

  private

  attr_reader :player, :player2, :next_player

  def winner?
    [player, player2].any?(&:winner?)
  end

  def next_turn!
    @next_player = opponent
  end

  def opponent
    @next_player == player ? player2 : player
  end
end
