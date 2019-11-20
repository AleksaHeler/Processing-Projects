class Car extends Rectangle{
  float speed;
  
  Car(float x, float y, float w, float h, float s){
    super(x,y,w,h);
    speed = s;
  }
  
  void show(){
    fill(200);
    stroke(0);
    rect(x, y, w, h);
  }
  
  void update(){
    x += speed;
    
    //resets if it goes off the screen
    if(speed > 0){
      if(x > width){
        x = -w-grid;
      }
    }else{
      if(x < 0-w-grid){
        x = width+grid;
      }
    }
  }
}