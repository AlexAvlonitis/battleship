require_relative '../lib/game'
require_relative '../lib/starter_boards'
require 'pry'

game = Game.build
game.player.name = 'Alex'
game.player2.name = 'Neo'

STARTER_BOARDS.each do |_, config|
  config[:times].times do
    game.player.place_ship(config[:ship], config[:col], config[:row])
  end
end

game.start
