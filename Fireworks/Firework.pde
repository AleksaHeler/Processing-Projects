class Firework {
  float x = random(-width/2, width/2);
  float y = 0;
  float velocity = 0;
  float thrust = random(0.05, 0.15);
  float wind = random(-0.02, 0.02);
  float windVelocity = 0;
  float explosionDist = -random(height/2, height);
  Sparks[] sparks;
  boolean spark = true;
  float time = random(3, 8);
  boolean reset = false;

  void show() {
    reset = false;
    if (y > explosionDist) {
      y -= velocity;
      velocity += thrust;
      x += windVelocity;
      windVelocity += wind;
      fill(100);
      noStroke();
      rect(x - 3, y - 10, 6, 20);
    } else if (!reset) {
      if (spark) {
        sparks = new Sparks[100];
        for (int i = 0; i < sparks.length; i++) {
          sparks[i] = new Sparks(x, y);
        }
        spark = false;
      }
      for (int i = 0; i < sparks.length; i++) {
        sparks[i].show();
      }
      time -= 0.02;
      if (time < 0) {
        x = random(-width/2, width/2);
        y = 0;
        velocity = 0;
        thrust = random(0.05, 0.15);
        wind = random(0.02, 0.02);
        windVelocity = 0;
        explosionDist = -random(height/2, height);
        time = random(3, 8);
        reset = true;
        spark = true;
      }
    }
  }
}