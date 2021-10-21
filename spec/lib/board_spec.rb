require 'spec_helper'
require 'board'
require 'cell'

describe Board do
  let(:board) { described_class.new(Cell, fleet, 10) }

  let(:fleet) do
     {
      carrier: [carrier],
      battleship: [battleship, battleship],
      cruiser: [cruiser, cruiser, cruiser],
      submarine: [submarine, submarine, submarine, submarine],
      destroyer: [destroyer, destroyer, destroyer, destroyer, destroyer]
    }
  end
  let(:carrier) { double(:ship, size: 5, name: :carrier, direction: :vertical, vertical?: true, horizontal?: false) }
  let(:battleship) { double(:ship, size: 4, name: :battleship, direction: :horizontal, vertical?: false, horizontal?: true) }
  let(:cruiser) { double(:ship, size: 3, name: :cruiser, direction: :horizontal, vertical?: false, horizontal?: true) }
  let(:submarine) { double(:ship, size: 3, name: :submarine, direction: :vertical, vertical?: true, horizontal?: false) }
  let(:destroyer) { double(:ship, size: 2, name: :destroyer, direction: :horizontal, vertical?: false, horizontal?: true) }

  it 'creates a square grid' do
    expect(board.grid.size).to eq 10
    expect(board.grid[0].size).to eq 10
  end

  context 'ship placements on success' do
    it "places a carrier ship correctly" do
      board.place_ship(:carrier, y: 5, x: 2)

      expect(board.grid[4][2].empty?).to eq true
      expect(board.grid[5][2].ship).to eq carrier
      expect(board.grid[6][2].ship).to eq carrier
      expect(board.grid[7][2].ship).to eq carrier
      expect(board.grid[8][2].ship).to eq carrier
      expect(board.grid[9][2].ship).to eq carrier
    end

    it "places a battleship correctly" do
      board.place_ship(:battleship, y: 0, x: 5)

      expect(board.grid[0][4].empty?).to eq true
      expect(board.grid[0][5].ship).to eq battleship
      expect(board.grid[0][6].ship).to eq battleship
      expect(board.grid[0][7].ship).to eq battleship
      expect(board.grid[0][8].ship).to eq battleship
    end
  end

  context 'ship placements on error' do
    it "raises out of bounds error on vertical" do
      expect { board.place_ship(:carrier, y: 6, x: 2) }
        .to raise_error('x: 2, y: 6, the ship will be out of boundaries')
    end

    it "allows only the permitted number of placements based on the fleet capacity" do
      board.place_ship(:carrier, y: 1, x: 1)

      expect { board.place_ship(:carrier, y: 1, x: 1) }
        .to raise_error('Add a different ship')
    end

    it "raises out of bounds error on horizontal" do
      expect { board.place_ship(:battleship, y: 1, x: 7) }
        .to raise_error('x: 7, y: 1, the ship will be out of boundaries')
    end
  end
end
