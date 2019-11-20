class Obstacle{
  
  float x;
  float y;
  float fallSpeed = 5;
  
  Obstacle(){
    x = random(0, width);
    y = random(-height * 2, -100);
  }
  
  void show(){
    fill(200,100,100);
    stroke(200);
    rect(x, y, 100, 100);
  }
  
  void fall(){
    y += fallSpeed;
    if(y > height){
      y = random(-height * 2, -height);
      x = random(0, width);
    }
  }
}