class LogRow{
  Log[] logs;
  float y;
  float speed;
  
  LogRow(int logCount, float y, float s){
    this.y = y;
    this.speed = s;
    
    logs = new Log[logCount];
    for(int i = 0; i < logs.length; i++){
      float x = floor(random(0, xresolution))*grid;
      float w = grid * floor(random(2, 5));
      logs[i] = new Log(x, y, w, grid, speed);
    }
  }
  
  void updateAndShow(){
    for(Log log : logs){
      //Animating cars
      log.update();
      log.show();
      
      //Checking collision
      //if(log.intersects(frog)){
      //  //Car hit frog
      //  //println("Game Over!");
      //  resetGame();
      //}
    }
  }
}