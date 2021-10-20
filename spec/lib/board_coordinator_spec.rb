require 'spec_helper'
require 'board_coordinator'

describe BoardCoordinator do
  let(:board_coordinator) { described_class.new(10, fleet) }

  let(:fleet) do
    [
      carrier,
      battleship,
      battleship,
      cruiser,
      cruiser,
      cruiser,
      submarine,
      submarine,
      submarine,
      submarine,
      destroyer,
      destroyer,
      destroyer,
      destroyer,
      destroyer
    ]
  end
  let(:carrier) { double(:ship, size: 5, name: :carrier) }
  let(:battleship) { double(:ship, size: 4, name: :battleship) }
  let(:cruiser) { double(:ship, size: 3, name: :cruiser) }
  let(:submarine) { double(:ship, size: 3, name: :submarine) }
  let(:destroyer) { double(:ship, size: 2, name: :destroyer) }

  it 'creates a square grid' do
    expect(board_coordinator.grid.size).to eq 10
    expect(board_coordinator.grid[0].size).to eq 10
  end

  ships = [
    [:carrier, 5],
    [:battleship, 8],
    [:cruiser, 9],
    [:submarine, 12],
    [:destroyer, 10]
  ].each do |ship, count|
    it "places the correct amount of #{ship.to_s}s" do
      board_coordinator.randomize_fleet_position
      c = 0
      board_coordinator.grid.each { |row| c += row.count { |cell| cell&.name == ship } }

      expect(c).to eq count
    end
  end
end
