// Goal is to evade falling objects

Player player;
Obstacle[] obstacles = new Obstacle[40];
float speed = 15;
boolean endGame = false;
int score;

void setup(){
  //size(600, 600);
  fullScreen();
  player = new Player();
  score = 0;
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Obstacle();
  }
}

void draw(){
  background(150, 150, 200);
  
  for(int i = 0; i < obstacles.length; i++){
    //Collision detection
    if(obstacles[i].x < player.x + 28 && 
    player.x - 28 < obstacles[i].x + 100 && 
    obstacles[i].y < player.y + 28 &&
    player.y - 28 < obstacles[i].y + 100){
      background(255,0,0);
      endGame = true;
    }
  }
  
  player.x = mouseX;
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i].fall();
    obstacles[i].show();
  }
  
  player.show();
  score++;
  
  if(endGame){
    stop();
    textSize(100);
    text("Score: " + score, 50, 150);
  }
} 
