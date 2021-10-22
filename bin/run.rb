require_relative '../lib/game'
require_relative '../lib/starter_boards'
require 'pry'

game = Game.build
game.player.name = 'Alex'
game.player2.name = 'Neo'

[game.player, game.player2].each do |player|
  STARTER_BOARDS.each do |carrier, battleship, cruiser|
    carrier.each do |c|
      player.place_ship(c[:ship], c[:col], c[:row], c[:direction])
    end

    battleship.each do |b|
      player.place_ship(b[:ship], b[:col], b[:row], b[:direction])
    end

    cruiser.each do |c|
      player.place_ship(c[:ship], c[:col], c[:row], c[:direction])
    end
  end
end

game.start
