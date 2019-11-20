Firework[] fireworks;
float randFloat;

void setup() {
  fullScreen();
  
  fireworks = new Firework[20];
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Firework();
  }
  randFloat = random(0, 9);
}

void draw() {
  translate(width/2, height);
  background(0, 10, 20);

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].show();
  }
}
