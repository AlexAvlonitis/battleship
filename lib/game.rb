class Game
  def self.build
    player = Player.build
    player2 = Player.build
  end

  def initialize(player, player2)
    @player = player
    @player2 = player2
  end

  def start
  end
end
