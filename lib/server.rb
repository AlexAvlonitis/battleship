require 'drb/drb'
require_relative './game'

class Server
  class << self
    HOST = 'localhost'
    PORT = '2000'
    URI = "druby://#{HOST}:#{PORT}"
    FRONT_OBJECT = Game.new

    def start_service
      DRb.start_service(URI, FRONT_OBJECT)
      puts 'Server started, awaiting clients...'

      DRb.thread.join
    end
  end
end

