class Sparks {
  float x;
  float y;

  float time = 0;
  float angle = random(0, TWO_PI);
  float velocity = random(0, 1);
  float gravity = 0.02;

  float r = random(150, 250);
  float g = random(150, 250);
  float b = random(150, 250);

  Sparks(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void show() {
    if (time < 2) {
      x += 1.4 * cos(angle);
      y += 1.4 * sin(angle);
      y += velocity;
      velocity += gravity;

      noStroke();
      fill(r, g, b);
      ellipse(x, y, map(time, 0, 2, 10, 0), map(time, 0, 2, 10, 0));
    }
    time += 0.01;
  }
}