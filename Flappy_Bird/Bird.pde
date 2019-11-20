class Bird {
  //Coordinates
  float x = 400;
  float y;
  //Force applied to bird when flapping
  float power = 10;
  //Gravity
  float gravity = 0.3;
  float velocity = 0;
  int col = 150;

  Bird() {
    y = -height / 2;
  }

  void update() {
    velocity += gravity;
    y += velocity;

    if (y > 0) {
      y = 0;
    } else if (y < -height) {
      y = -height;
    }
  }

  void show() {
    noStroke();
    fill(col, 150, 0);
    ellipse(x, y, 60, 60);
  }

  void up() {
    y -= power;
    velocity = 0;
  }
}