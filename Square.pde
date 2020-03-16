class Square
{
  int player, index; 
  float x, y, size;

  Square(int i, float x1, float y1, float s1)
  {
    player = 0;
    index = i;
    x = x1;
    y = y1;
    size = s1;
  }

  void turn()
  {
    if (playerX == true && player == 0) 
    {
      player = 1;
    } else if (playerX == false && player == 0) 
    {
      player = 2;
    }
    println(index);
  }

  void show()
  {
    pushStyle();
    fill(255);
    textSize(50);
    if (player == 1)
    {
      String blah = ""+int(x)+""+int(y);
      s.write(blah);
      text("X", x - 15, y + 15);
      println(blah);
    } else if (player == 2)
    {
      noFill();
      String blah = ""+int(x)+""+int(y);
      s.write(blah);
      //Float.toString(x) + Float.toString(y)
      ellipse(x, y, 2*size/3, 2*size/3);
    }
    popStyle();
  }

  boolean check()
  {
    if (mouseX > this.x - this.size/2 && mouseX < this.x + this.size/2)
    {
      if (mouseY > this.y - this.size/2 && mouseY < this.y +this.size/2)
      {
        return true;
      }
    }
    return false;
  }
}