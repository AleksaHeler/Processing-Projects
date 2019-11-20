class Drop{
  
  float x = random(0, width);
  float y = random(-height * 2, 0);
  float velocity = 5;
  float gravity = 0.2;
  float size = random (0, 1);
  
  void fall(){
    y += velocity * size;
    velocity += gravity;
    if(y > height){
      x = random(0, width);
      y = 0;
      velocity = 10;
    }
  }
  
  void show(){
    fill(50,100,200);
    noStroke();
    rect(x, y, 4 * size, 20 * size);
  }
}
