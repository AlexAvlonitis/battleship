require 'drb/drb'
require_relative './player'
require_relative './starter_boards'

class Client
  class << self
    HOST = 'localhost'
    PORT = '2000'
    SERVER_URI = "druby://#{HOST}:#{PORT}"

    def start_service
      DRb.start_service
      game = DRbObject.new_with_uri(SERVER_URI)

      rand_name = ('a'..'z').to_a.sample(3).join
      player = Player.build(rand_name)
      add_fleet_to_player(player)

      game.add_player(player)

      loop do
        puts 'Awaiting for players to join...'
        sleep 1
        clear_screen

        if game.enough_players?
          until game.any_loser? do
            sleep 1
            if player.name == game.next_player.name
              player.render_boards(game.opponent)
              player.attack(game.opponent)
              game.next_turn!
            else
              clear_screen
              puts 'Waiting opponent\'s turn'
            end
          end

          puts player.you_won
          break
        end
      rescue DRb::DRbConnError
        puts player.you_lost
        break
      end
    end

    private

    def add_fleet_to_player(player)
      STARTER_BOARDS.each do |ships|
        ships.each do |ship|
          ship_conf = ship[:ship_conf]
          s = Ship.new(ship_conf[:size], ship_conf[:type], ship_conf[:direction])
          player.place_ship(s, ship[:row], ship[:col])
        end
      end
    end

    def clear_screen
      windows? ? system('cls') : system('clear')
    end

    def windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end
  end
end

