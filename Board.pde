class Board 
{
  float space, cell;
  Square[] c;
  boolean on;
  int winner;
  float x, y, size;
  int index;

  Board(float w, float x, float y, int ind) 
  {
    space = w/20;
    cell = (w - 2*space)/3;
    this.x = x;
    this.y = y;
    size = w;
    on = true;
    index = ind;
    winner = 0;
    c = new Square[9];    
    for (int i = 0; i < 3; i++) 
    {
      for (int j = 0; j < 3; j++) 
      {
        c[3*i + j] = new Square(3*i + j, this.x + this.space + (i + 0.5)*this.cell, this.y + this.space + (j + 0.5)*this.cell, cell);
      }
    }
  }

  void show() 
  {
    strokeWeight(8);
    pushStyle();
    fill(150);
    if (this.index == game.nextBoard) 
    {
      fill(230);
    } 
    else 
    {
      fill(0);
    }
    rect(x, y, size, size);
    popStyle();
    
    strokeWeight(2);
    stroke(255);
    for (int i = 80; i < width - 80; i = i + 71)
    {
      line (i, 80, i, height - 80);
      line (80, i, width - 80, i);
    }


    for (int i = 0; i < c.length; i++) 
    {
      c[i].show();
    }

    if (this.winner == 1) 
    {     
      fill(150, 150);
      rect(x, y, size, size);
      line(x + size/6, y + size/6, x + 5*size/6, y + 5*size/6);
      line(x + size/6, y + 5*size/6, x + 5*size/6, y + size/6);
    } else if (this.winner == 2) 
    {
      fill(150, 150);
      rect(x, y, size, size);
      noFill();
      ellipse(x + size/2, y + size/2, 2  *size/3, 2*size/3);
    }
  }

  void check() 
  {
    if (game.nextBoard == this.index || game.nextBoard == -1) 
    {
      if (mouseX > this.x + this.space && mouseX < this.x + this.size - this.space) 
      {
        if (mouseY > this.y + this.space && mouseY < this.y + this.size - this.space) 
        {
          for (int i = 0; i < c.length; i++) 
          {
            if (c[i].check()) 
            {
              c[i].turn();
              if (game.boards[i].on) 
              {
                game.nextBoard = i;
                game.boards[i].show();
              } else 
              {
                game.nextBoard = -1;
              }
              this.show();
              playerX = !playerX;
              //println("YEEE");
            }
          }
          for (int i = 0; i < 3; i++) 
          {
            if (c[3*i].player == c[3*i+1].player && c[3*i+1].player == c[3*i+2].player && c[3*i].player != 0) 
            {
              this.winner = c[3*i].player;
              this.on = false;
              this.show();
            }

            if (c[i].player == c[i+3].player && c[i+3].player == c[i+6].player && c[i].player != 0) 
            {
              this.winner = c[i].player;
              this.on = false;
              this.show();
            }
          }

          if ((c[0].player == c[4].player && c[4].player == c[8].player && c[0].player != 0) || (c[2].player == c[4].player && c[4].player == c[6].player && c[2].player != 0)) {
            this.winner = c[4].player;
            this.on = false;
            this.show();
          }

          if (game.nextBoard == this.index && this.on == false) 
          {
            game.nextBoard = -1;
          }
        }
      }
    }
  }
}