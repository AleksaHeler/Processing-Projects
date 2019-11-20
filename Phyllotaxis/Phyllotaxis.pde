// That plant thing where seeds go in circle and make nice patterns, like sunflower
// https://en.wikipedia.org/wiki/Phyllotaxis

int n = 0;
float c = 5;

void setup(){
  size(600, 600);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  
  float a = n * 137.4;
  float r = c * sqrt(n);
  
  float x = r * cos(a);
  float y = r * sin(a);
  
  fill(255, 155 + (n % 100),  0);
  noStroke();
  ellipse(x, y, 5, 5);
  
  n++;
}
