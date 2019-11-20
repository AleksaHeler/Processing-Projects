// simulates a planet rotating around the sun

float x;
float y;
float gravity = 0.00005;
PVector acc;
PVector vel;

float speed;

void setup() {
  fullScreen();
  background(20);
  x = width/2 + 300;
  y = height /2;
  vel = new PVector(3, 1);
}

void draw() {
  //background(20);

  speed = mouseX;

  //Sun
  fill(250, 250, 100);
  noStroke();
  ellipse(width/2, height/2, 100, 100);

  //Earth
  fill(random(150, 250), random(150, 250), random(150, 250));
  noStroke();
  ellipse(x, y, 20, 20);
  acc = new PVector((width/2 - x) * gravity, (height/2 - y) * gravity);
  vel.add(acc);
  x += vel.x;
  y += vel.y;
}
