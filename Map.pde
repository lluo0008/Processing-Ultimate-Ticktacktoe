class Map 
{
  Board[] boards;
  float space, cell;
  int nextBoard;
  boolean on;

  Map(float w) 
  {
    space = w/10;
    cell = (w - 2*space)/3;
    nextBoard = -1; 
    on = true; 
    boards = new Board[9];
    for (int i = 0; i < 3; i++) 
    {
      for (int j = 0; j < 3; j++) 
      {
        boards[3*i + j] = new Board(this.cell, space + i*cell, space + j*cell, 3*i + j);
        
      }
    }
  }

  void show() 
  {
    //fill(0);
    for (int i = 0; i < boards.length; i++) 
    {
      boards[i].show();
    }
  }
  void check() 
  {
    for (int i = 0; i < boards.length; i++) 
    {
      if (boards[i].on)
      {
        boards[i].check();
      }
    }

    for (int i = 0; i < 3; i++) 
    {
      if (boards[3*i].winner == boards[3*i + 1].winner && boards[3*i + 1].winner == boards[3*i + 2].winner && boards[3*i].winner != 0) 
      {
        declareWinner(boards[3*i].winner);
      }
      if (boards[i].winner == boards[i + 3].winner && boards[i + 3].winner == boards[i + 6].winner && boards[i].winner != 0) 
      {
        declareWinner(boards[i].winner);
      }
    }

    if ((boards[0].winner == boards[4].winner && boards[4].winner == boards[8].winner && boards[0].winner != 0) || (boards[2].winner == boards[4].winner && boards[4].winner == boards[6].winner && boards[2].winner != 0)) 
    {
      declareWinner(boards[4].winner);
    }

    boolean draw = true;

    for (int i = 0; i < boards.length; i++) 
    {
      if (boards[i].on) 
      {
        draw = false;
      }
    }
    if (draw && game.on) 
    {
      declareWinner(0);
    }
  }
}