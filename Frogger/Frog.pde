class Frog extends Rectangle{
  
  Frog(float x, float y, float w){
    super(x,y,w,w);
  }
  
  void move(float xdir, float ydir){
    x += xdir*grid;
    y += ydir*grid;
    
    //Checking wall collisson
    if(x >= width) {
      x = width - grid;
    }else if(x < 0){
      x = 0;
    }if(y < 0){
      y = 0;
    }else if(y >= height){
      y = height - grid;
    }
  }
  
  void show(){
    fill(255);
    noStroke();
    rect(x, y, w, h);
  }
}