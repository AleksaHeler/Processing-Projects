class Enemy{
  public PVector pos;
  public float speed = 3;
  public int w = 30;
  public int h = 10;
  public int damage;
  public int mode = 0;
  
  Enemy(float x, float y, float spd, int m){
    pos = new PVector(x, y);
    speed = spd;
    damage = int(random(10, 40));
    mode = m;
    if(m == 1){
      spd = int(spd*(2.0/3));
    }
  }
  
  void update(){
    if(mode == 0){//Chase player mode
      PVector f = new PVector(mouseX - pos.x, mouseY - pos.y);
      f.normalize();
      pos.add(f.mult(speed));
    }else if(mode == 1){//Attack base mode
      pos.x -= speed;
    }
  }
  
  void show(){
    strokeWeight(1);
    stroke(255);
    if(mode == 0){
      fill(200, 50, 50);
    }else if(mode == 1){
      fill(100, 20, 100);
    }
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
}