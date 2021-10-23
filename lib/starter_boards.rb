STARTER_BOARDS = [
  [
    { col: 0, row: 0, ship: Ship.new(5, :carrier, :vertical) }
  ],
  [
    { col: 1, row: 1, ship: Ship.new(4, :battleship, :horizontal) },
    { col: 2, row: 4, ship: Ship.new(4, :battleship, :horizontal) }
  ],
  [
    { col: 7, row: 5, ship: Ship.new(3, :cruiser, :vertical) },
    { col: 6, row: 6, ship: Ship.new(3, :cruiser, :vertical) },
    { col: 5, row: 7, ship: Ship.new(3, :cruiser, :vertical) }
  ],
  [
    { col: 1, row: 6, ship: Ship.new(3, :submarine, :horizontal) },
    { col: 2, row: 7, ship: Ship.new(3, :submarine, :horizontal) },
    { col: 6, row: 3, ship: Ship.new(3, :submarine, :horizontal) },
    { col: 4, row: 5, ship: Ship.new(3, :submarine, :horizontal) }
  ],
  [
    { col: 9, row: 8, ship: Ship.new(2, :destroyer, :vertical) },
    { col: 8, row: 8, ship: Ship.new(2, :destroyer, :vertical) },
    { col: 7, row: 8, ship: Ship.new(2, :destroyer, :vertical) },
    { col: 9, row: 0, ship: Ship.new(2, :destroyer, :vertical) },
    { col: 8, row: 0, ship: Ship.new(2, :destroyer, :vertical) }
  ]
]
