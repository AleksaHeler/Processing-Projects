// Simple paint program
// draw, erase, size and color select

Btn rColBtn;
Btn gColBtn;
Btn bColBtn;
Btn wColBtn;
int[] col = new int[3];
float thickness = 2;

void setup() {
  //Envoronment
  fullScreen();
  background(50);
  col[0] = 250;
  col[1] = 250;
  col[2] = 250;
}

void draw() {

  //Draws a menu bar

  //Background
  fill(150);
  noStroke();
  rect(0, 0, width, height/9);

  //Color selection buttons
  rColBtn = new Btn(10, 10, width/5, height/28, 250, 100, 100);
  gColBtn = new Btn(10, 50, width/5, height/28, 100, 250, 100);
  bColBtn = new Btn(width/5 + 20, 10, width/5, height/28, 100, 100, 250);
  wColBtn = new Btn(width/5 + 20, 50, width/5, height/28, 250, 250, 250);

  textSize(20);
  text("DRAW - left mouse button", 850, 30);
  text("ERASE - right mouse button", 850, 60);
  text("SIZE - numbers 1,2,3...9", 850, 90);

  //Checks for button press
  if (rColBtn.Clicked()) {
    col[0] = 250;
    col[1] = 100;
    col[2] = 100;
  }
  if (gColBtn.Clicked()) {
    col[0] = 100;
    col[1] = 250;
    col[2] = 100;
  }
  if (bColBtn.Clicked()) {
    col[0] = 100;
    col[1] = 100;
    col[2] = 250;
  }
  if (wColBtn.Clicked()) {
    col[0] = 250;
    col[1] = 250;
    col[2] = 250;
  }

  //Displays mouse position
  fill(255);
  noStroke();
  textSize(20);
  text("X: " + mouseX, width - width/16, height/25);
  text("Y: " + mouseY, width - width/16, height/12);




  //Draws a line on left click
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(col[0], col[1], col[2]);
    fill(col[0], col[1], col[2]);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  //Eraser on right click
  if (mousePressed && (mouseButton == RIGHT)) {
    stroke(50);
    fill(50);
    strokeWeight(thickness*2);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }



  //Changes thickness on key press
  if (keyPressed) {
    if (key == '1') {
      thickness = 2;
    } else if (key == '2') {
      thickness = 4;
    } else if (key == '3') {
      thickness = 6;
    } else if (key == '4') {
      thickness = 8;
    } else if (key == '5') {
      thickness = 10;
    } else if (key == '6') {
      thickness = 12;
    } else if (key == '7') {
      thickness = 14;
    } else if (key == '8') {
      thickness = 16;
    } else if (key == '9') {
      thickness = 18;
    }
  }
}












//Button class
class Btn {
  float x;
  float y;
  float sizeX;
  float sizeY;
  float[] col = {0, 0, 0};

  Btn(float _x, float _y, float _sizeX, float _sizeY, int r, int g, int b) {
    x = _x;
    y = _y;
    sizeX = _sizeX;
    sizeY = _sizeY;
    col[0] = r;
    col[1] = g;
    col[2] = b;

    noStroke();
    fill(col[0], col[1], col[2]);
    rect(x, y, sizeX, sizeY);
  }

  boolean Clicked() {
    if (mouseX > x && mouseX < x + sizeX && mouseY > y && mouseY < y + sizeY) {
      fill(col[0] - 30, col[1] - 30, col[2] - 30);
      rect(x, y, sizeX, sizeY);
      if (mousePressed) {
        return true;
      }
    }
    return false;
  }
}
