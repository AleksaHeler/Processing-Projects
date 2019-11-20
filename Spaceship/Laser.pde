class Laser{
  public PVector pos;
  public float w = 30;
  public float h = 5;
  
  Laser(float x, float y){
    pos = new PVector(x, y);
  }
  
  void show(){
    noStroke();
    fill(220, 220, 220);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
}