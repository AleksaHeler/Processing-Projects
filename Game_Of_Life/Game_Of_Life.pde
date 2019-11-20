// Conway's Game of Life

int scl = 30;
float w;
int[][] arr;
int txtSize = 10;

void setup(){
  fullScreen();
  frameRate(10);
  textSize(txtSize);
  
  w = (float)height/scl;
  arr = new int[scl][scl];
  //generate random cells, with 30% chance for a cell to be alive
  generate(15);
}
      
void draw(){
  background(51);
  
  update();
  show();
}

void generate(int chance){
  for(int i = 0; i < scl; i++){
    for(int j = 0; j < scl; j++){
      if(int(random(100)) < chance){
        arr[i][j] = 1;
      }
      else{
        arr[i][j] = 0;
      }
    }
  }
}

void show(){
  translate((width-w*scl)/2, 0);  
  strokeWeight(1);
  stroke(0);
  for(int i = 0; i < scl; i++){
    for(int j = 0; j < scl; j++){
      fill(26);
      if(arr[i][j]==1){fill(230);}
      rect(i*w, j*w, w, w);
      
      //Drawing numbers
      noStroke();
      fill(255);
      if(arr[i][j] == 1){fill(51);}
      int n = Neighbours(i, j);
      //text(n+"", i*w+(w/2-textWidth(n+"")/2), j*w+(w/2-txtSize));
    }
  }
}

void update(){
  for(int i = 0; i < scl; i++){
    for(int j = 0; j < scl; j++){
      int n = Neighbours(i, j);
      
      if(arr[i][j]==1){
        // Any live cell with two or three neighbors survives
        if(n==2 || n==3){arr[i][j]=1;}
        // All other live cells die
        else{arr[i][j]=0;}
      }
      else{
        // Any dead cell with three live neighbors becomes a live cell
        if(n==3){arr[i][j]=1;}
      }
    }
  }
}

// very bad and hard coded way to get the number of neighbours
int Neighbours(int i, int j){
  int n = 0;
  if(i > 0 && i < scl-1){
    if(j > 0 && j < scl-1){
      n+=arr[i+1][j+1];
      n+=arr[i+1][j];
      n+=arr[i+1][j-1];
      n+=arr[i][j+1];
      n+=arr[i][j-1];
      n+=arr[i-1][j+1];
      n+=arr[i-1][j];
      n+=arr[i-1][j-1];
    }else if(j == 0){
      n+=arr[i+1][j+1];
      n+=arr[i+1][j];
      n+=arr[i][j+1];
      n+=arr[i-1][j+1];
      n+=arr[i-1][j];
    }else if(j == scl-1){
      n+=arr[i+1][j];
      n+=arr[i+1][j-1];
      n+=arr[i][j-1];
      n+=arr[i-1][j];
      n+=arr[i-1][j-1];
    }
  }else if(i == 0){
    if(j > 0 && j < scl-1){
      n+=arr[i+1][j+1];
      n+=arr[i+1][j];
      n+=arr[i+1][j-1];
      n+=arr[i][j+1];
      n+=arr[i][j-1];
    }else if(j == 0){
      n+=arr[i+1][j+1];
      n+=arr[i+1][j];
      n+=arr[i][j+1];
    }else if(j == scl-1){
      n+=arr[i+1][j];
      n+=arr[i+1][j-1];
      n+=arr[i][j-1];
    }
  }else if(i == scl-1){
    if(j > 0 && j < scl-1){
      n+=arr[i][j+1];
      n+=arr[i][j-1];
      n+=arr[i-1][j+1];
      n+=arr[i-1][j];
      n+=arr[i-1][j-1];
    }else if(j == 0){
      n+=arr[i][j+1];
      n+=arr[i-1][j+1];
      n+=arr[i-1][j];
    }else if(j == scl-1){
      n+=arr[i][j-1];
      n+=arr[i-1][j];
      n+=arr[i-1][j-1];
    }
  }
  return n;
}
