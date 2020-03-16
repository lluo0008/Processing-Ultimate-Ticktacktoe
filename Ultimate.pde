import processing.net.*;





//                                          I could not get the server and client to send correctly, but the game works





boolean playerX;
boolean on;

String data = "n";
String inData, outData;
String msg;
String restart;
Server s;

int test, test2;

Square[] send = new Square[9];

Board b;
Map game;
void setup() 
{
  size(800, 800);
  
  s = new Server(this, 1234);
  msg = "";
  data = "n";
  restart = "n";
  
  strokeWeight(5);
  stroke(255);
  background(0);
  playerX = true;
  on = true;
  noFill();
  game = new Map(width);
  game.show();
  textSize(23);
  
}

void draw() 
{
  Client client = s.available();
  
  stroke(255);
  
  pushStyle();
  
  //textSize(20);
  //text("SPACE TO RESTART", 0, 30);
  
  textSize(50);
  
  if (game.on) 
  {
    if (playerX) 
    {
      //pushStyle();
      noStroke();
      fill(0);
      rect(200, 0, 400, 60);
      fill(255);
      text("Player 1 turn", 250, 50);
   
      //popStyle();
    } 
    else if (playerX == false)
    {
      //pushStyle();
      noStroke();
      fill(0);
      rect(200, 0, 400, 60);
      fill(255);
      text("Player 2 turn", 250, 50);
      //fill(200);
      //popStyle();
    }
  }
  popStyle();
  
  if (client != null)
  {
    msg = client.readString();
    //data = client.readString();
    //println(msg.length());
    //println("yeet");


    //if (data.substring(0, 1).equals("y"))
    //{
    //  textSize(15);
    //  text("your opponent has requested a restart. Please be a good human and do the same", 300, 40);
    //}
    //else
    //{
    
    
    
    
    //board[Integer.parseInt(msg.substring(0, 1))][Integer.parseInt(msg.substring(1, 2))] = 2;
    test = Integer.parseInt(msg.substring(0, 3));
    test2 = Integer.parseInt(msg.substring(3, 6));
    println("ok" + test);
    println("ko" + test2);
    
    
    
    for (int i = 0; i < 3; i++) 
    {
      for (int j = 0; j < 3; j++) 
      {
        send[3*i + j] = new Square(3*i + j, test, test2, (width/10 - 2*width/10)/3);
      }
    }
    //send = new Square(0, test, test2, (w - 2*width/20)/3);
    println(send);
    playerX = false;
    //}
  }
}

void mousePressed() 
{
  if (game.on)
  {
    game.check();
  }
}

void declareWinner(int winner) 
{
  game.on = false;
  fill(200, 200);
  textSize(33);
  rect(0, 0, width, height);
  fill(255, 100, 100);
  if (winner == 1) 
  {    
    text("Player 1 wins!", width/2, height/2);
  } 
  else if (winner == 2) 
  {
    text("Player 2 wins!", width/2, height/2);
  } 
  else 
  {
    text("Nobody wins!", width/2, height/2);
  }
}