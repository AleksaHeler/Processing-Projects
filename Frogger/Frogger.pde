Frog frog;
CarRow[] carRows;
LogRow[] logRows;
float xresolution; //number of squares on x axis
float yresolution; //number of squares on y axis
float grid; //size of squares on the grid
int difficulty = 3;

void setup(){
  //grid*resolution
  size(800, 800);
  switch(difficulty){
    case 1:grid = 80;break;
    case 2:grid = 50;break;
    case 3:grid = 32;break;
    case 4:grid = 20;break;
    default:grid = 10;break;
  }
  xresolution = width/grid;
  yresolution = height/grid;
  
  //Initializing frog
  frog = new Frog(width/2-grid, height-grid, grid); //posx, posy, width
  
  initializeCarRows();  
  initializeLogRows();
}

void draw(){
  drawBackground();
  
  //Animating Cars and Logs
  for(CarRow carRow : carRows){
    carRow.updateAndShow();
  }
  for(LogRow logRow : logRows){
    logRow.updateAndShow();
  }
  
  frog.show();
}

void keyPressed(){
  switch(keyCode){
    case UP:
      frog.move(0, -1);
      break;
    case DOWN:
      frog.move(0, 1);
      break;
    case LEFT:
      frog.move(-1, 0);
      break;
    case RIGHT:
      frog.move(1, 0);
      break;
  }
}

void drawBackground(){
  background(50);
  
  //Bottom 'safe' row
  fill(100, 250, 100);
  noStroke();
  rect(0, height-grid*2,width, grid*2);
  
  //Middle row
  rect(0, height-grid*(2+carRows.length),width, -grid*2);
}

void initializeCarRows(){
  //Initializing car rows
  int rowCount = int((xresolution-5)/2);
  carRows = new CarRow[rowCount];
  for(int i = 0; i < carRows.length; i++){
    int carCount = floor(random(1,4));
    float rowOffset = height - i*grid - 3*grid;
    float speed = floor(random(1, 4)); //random speed
    //Choosing direction
    int direction = 1;
    if(floor(random (0, 2)) == 0){
      direction = -1;
    }
    carRows[i] = new CarRow(carCount, rowOffset, direction*speed);
  }
}

void initializeLogRows(){
  //Initializing log rows
  int rowCount = floor(yresolution/3);
  switch(difficulty){
    case 2:rowCount++;break;
    case 3:rowCount+=2;break;
    case 4:rowCount+=5;break;
    default:rowCount+=12;break;
  }
  logRows = new LogRow[rowCount];
  for(int i = 0; i < logRows.length; i++){
    int logCount = floor(random(1,3));
    float rowOffset = height - 5*grid - carRows.length*grid - i*grid;
    float speed = floor(random(1, 4)); //random speed
    //Choosing direction
    int direction = 1;
    if(floor(random (0, 2)) == 0){
      direction = -1;
    }
    logRows[i] = new LogRow(logCount, rowOffset, direction*speed);
  }
}

void resetGame(){
  //Reseting frogs location
  frog.x = width/2-grid;
  frog.y = height-grid;
}
