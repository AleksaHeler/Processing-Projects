// Langton's ant is a two-dimensional universal Turing machine with a very simple set of rules but complex emergent behavior.
// It was invented by Chris Langton in 1986 and runs on a square lattice of black and white cells.

int scl = 100;
float w;
int x = scl/2;
int y = scl/2;
int dir = 0; // 0, 1, 2, 3

boolean[][] arr = new boolean[100][100];

void setup() {
  size(500, 500);
  w = width/scl;
  
  //draw grid
  for (int i=0; i < scl; i++) {
    for (int j=0; j < scl; j++) {
      if (x == i && y == j) {
        fill(100, 250, 100);
      } else if (arr[i][j] == true) {
        fill(255);
      } else {
        fill(51);
      }
      stroke(0);
      rect(i*w, j*w, scl*2, scl*2);
    }
  }
}

void draw() {
  //background(0);

  //Update cells
  update();

  //Save the frames
  //saveFrame("video/img###");
}

void update() {
  if (arr[(int)x][y] == true) {
    dir++;
    dir%=4;
    arr[x][y] = false;
    fill(51);
    rect(x*w, y*w, w, w);
    move();
  } else{
    dir+=3;
    dir%=4;
    arr[x][y] = true;
    fill(255);
    rect(x*w, y*w, w, w);
    move();
  }
}

void move() {
  switch(dir) {
  case 0:
    y--;
    break;
  case 1:
    x++;
    break;
  case 2:
    y++;
    break;
  case 3:
    x--;
    break;
  default:
    break;
  }
}
