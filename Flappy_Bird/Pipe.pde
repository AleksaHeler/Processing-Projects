class Pipes {
  float x1;
  float x2;
  float x3;
  float yTop1;
  float yBottom1;
  float yTop2;
  float yBottom2;
  float yTop3;
  float yBottom3;
  float center = 100;
  float speed = 3;
  float space = 200;

  Pipes() {
    //Sets starting points
    x1 = 1500;
    x2 = 1500 + 533;
    x3 = 1500 + 1066;

    //Sets random height for pipe 1
    yTop1 = random(height/4, (height/4) * 3);
    yBottom1 = height - yTop1 - space;

    //Sets random height for pipe 2
    yTop2 = random(height/4, (height/4) * 3);
    yBottom2 = height - yTop2 - space;

    //Sets random height for pipe 3
    yTop3 = random(height/4, (height/4) * 3);
    yBottom3 = height - yTop3 - space;
  }

  void update() {
    //Moves pipes
    x1 -= speed;
    x2 -= speed;
    x3 -= speed;

    //Checks if pipe 1 is off screen
    if (x1 < -100) {
      //Resets the position to beginning
      x1 = 1500;
      //Sets random height for pipe 1
      yTop1 = random(height/4, (height/4) * 3);
      yBottom1 = height - yTop1 - space;
    }    

    //Checks if pipe 2 is off screen
    if (x2 < -100) {
      //Resets the position to beginning
      x2 = 1500;
      //Sets random height for pipe 2
      yTop2 = random(height/4, (height/4) * 3);
      yBottom2 = height - yTop2 - space;
    }

    //Checks if pipe 2 is off screen
    if (x3 < -100) {
      //Resets the position to beginning
      x3 = 1500;
      //Sets random height for pipe 3
      yTop3 = random(height/4, (height/4) * 3);
      yBottom3 = height - yTop3 - space;
    }
  }

  void show() {

    //Sets color
    fill(255);
    noStroke();

    //Top rect
    rect(x1, -height, 100, yTop1);
    //Bottom rect
    rect(x1, -yBottom1, 100, yBottom1);

    //Top rect
    rect(x2, -height, 100, yTop2);
    //Bottom rect
    rect(x2, -yBottom2, 100, yBottom2);

    //Top rect
    rect(x3, -height, 100, yTop3);
    //Bottom rect
    rect(x3, -yBottom3, 100, yBottom3);
  }
}