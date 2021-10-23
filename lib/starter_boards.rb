STARTER_BOARDS = [
  [
    { col: 0, row: 0, ship_conf: { size: 5, type: :carrier, direction: :vertical } }
  ],
  [
    { col: 1, row: 1, ship_conf: { size: 4, type: :battleship, direction: :horizontal } },
    { col: 2, row: 4, ship_conf: { size: 4, type: :battleship, direction: :horizontal } }
  ],
  [
    { col: 7, row: 5, ship_conf: { size: 3, type: :cruiser, direction: :vertical } },
    { col: 6, row: 6, ship_conf: { size: 3, type: :cruiser, direction: :vertical } },
    { col: 5, row: 7, ship_conf: { size: 3, type: :cruiser, direction: :vertical } }
  ],
  [
    { col: 1, row: 6, ship_conf: { size: 3, type: :submarine, direction: :horizontal } },
    { col: 2, row: 7, ship_conf: { size: 3, type: :submarine, direction: :horizontal } },
    { col: 6, row: 3, ship_conf: { size: 3, type: :submarine, direction: :horizontal } },
    { col: 4, row: 5, ship_conf: { size: 3, type: :submarine, direction: :horizontal } }
  ],
  [
    { col: 9, row: 8, ship_conf: { size: 2, type: :destroyer, direction: :vertical } },
    { col: 8, row: 8, ship_conf: { size: 2, type: :destroyer, direction: :vertical } },
    { col: 7, row: 8, ship_conf: { size: 2, type: :destroyer, direction: :vertical } },
    { col: 9, row: 0, ship_conf: { size: 2, type: :destroyer, direction: :vertical } },
    { col: 8, row: 0, ship_conf: { size: 2, type: :destroyer, direction: :vertical } }
  ]
]
