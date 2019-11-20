// Simulates rain

Drop[] drops = new Drop[500];

void setup(){
  fullScreen();
  for(int i = 0; i < drops.length; i++){
    drops[i] = new Drop();
  }
}
void draw(){
  background(30,40,50);
  for(int i = 0; i < drops.length; i++){
    drops[i].fall();
    drops[i].show();
  }
}
