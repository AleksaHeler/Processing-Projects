// Simpe spaceship game

Ship ship;

void setup(){
  fullScreen();
  noCursor();
  frameRate(50);
  
  ship = new Ship(width/12, height/2);
}

void draw(){
  background(51);
  
  if(ship.update()){
    ship.show();
  }
}
