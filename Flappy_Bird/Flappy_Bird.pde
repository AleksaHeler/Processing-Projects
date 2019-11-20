// A very simple and primitive example of flappy bird
// While left mouse button is pressed it goes up

Pipes pipes;
Bird bird;
int score = 0;
boolean endGame;

void setup() {
  fullScreen();
  pipes = new Pipes();
  bird = new Bird();
  endGame = false;
}

void draw() {
  if(!endGame){
    //Sets environment
    translate(0, height);
    background(150, 150, 200);
  
    //Animates pipes
    pipes.update();
    pipes.show();
  
    //Animates bird
    bird.update();
    bird.show();
    bird.col = 150;
  
    //Makes bird fly
    if (mousePressed && (mouseButton == LEFT)){
      bird.up();
    }
  
    //Counts score
    if (pipes.x1 + 100 - 2 < bird.x && bird.x < pipes.x1 + 100 + 2) {
      score++;
    }
    if (pipes.x2 + 100 - 2 < bird.x && bird.x < pipes.x2 + 100 + 2) {
      score++;
    }
    if (pipes.x3 + 100 - 2 < bird.x && bird.x < pipes.x3 + 100 + 2) {
      score++;
    }
  
    //Checks for collision with pipe 1
    if (bird.x + 30 > pipes.x1 && bird.x - 30 < pipes.x1 + 100) {
      if (bird.y < -height + pipes.yTop1) {
        bird.col = 255;
        endGame = true;
      } else if (bird.y > -pipes.yBottom1) {
        bird.col = 255;
        endGame = true;
      }
    }
    //Checks for collision with pipe 2
    if (bird.x + 30 > pipes.x2 && bird.x - 30 < pipes.x2 + 100) {
      if (bird.y < -height + pipes.yTop2) {
        bird.col = 255;
        endGame = true;
      } else if (bird.y > -pipes.yBottom2) {
        bird.col = 255;
        endGame = true;
      }
    }
    //Checks for collision with pipe 3
    if (bird.x + 30 > pipes.x3 && bird.x - 30 < pipes.x3 + 100) {
      if (bird.y < -height + pipes.yTop3) {
        bird.col = 255;
        endGame = true;
      } else if (bird.y > -pipes.yBottom3) {
        bird.col = 255;
        endGame = true;
      }
    }
    
    //Prints framerate and score
    textSize(20);
    fill(200);
    text("Framerate: " + round(frameRate), 10, -height+30);
    text("Score: " + score, 10, -height+60);
  }
  //Ends game
  else if(endGame){    
    background(80);
    //Displays score at the end
    fill(200,200,100);
    stroke(255);
    strokeWeight(5);
    textSize(120);
    text("Score: " + score, 500, 400);
  }
}
