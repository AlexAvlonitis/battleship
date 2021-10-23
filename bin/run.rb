require_relative '../lib/game'
require_relative '../lib/starter_boards'
require 'pry'

game = Game.build
game.player.name = 'Alex'
game.player2.name = 'Neo'

[game.player, game.player2].each do |player|
  STARTER_BOARDS.each do |ships|
    ships.each do |ship|
      player.place_ship(ship[:ship], ship[:row], ship[:col])
    end
  end
end

game.start
