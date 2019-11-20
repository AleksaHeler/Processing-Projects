class Player{
  
  float x;
  float y;
  
  Player(){
    x = 0;
    y = height / 3 * 2;
  }

  void show(){
    fill(255);
    noStroke();
    ellipse(x, y, 60, 60);
  }
}