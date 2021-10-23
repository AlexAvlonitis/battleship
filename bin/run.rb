require_relative '../lib/game'
require_relative '../lib/starter_boards'

game = Game.build
game.player.name = 'Alex'
game.player2.name = 'Neo'

[game.player, game.player2].each do |player|
  STARTER_BOARDS.each do |ships|
    ships.each do |ship|
      ship_conf = ship[:ship_conf]
      s = Ship.new(ship_conf[:size], ship_conf[:type], ship_conf[:direction])
      player.place_ship(s, ship[:row], ship[:col])
    end
  end
end

game.start
