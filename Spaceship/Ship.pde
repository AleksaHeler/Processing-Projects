class Ship{  
  //Variables
  public PVector pos;
  public float smooth = 0.16;
  public int cooldown = 15;
  public int count = 0;
  public Laser[] lasers;
  public int laserCount = 0;
  public float laserSpeed = 10;
  public int killCount = 0;
  Enemy[] enemies;
  public int enemyCount = 0;
  public int health = 100;
  public float spawnTimeSpan = 1;
  public int w = 50;
  public int h = 20;
  //End of variables
  
  //Constructor function
  Ship(float x, float y){
    pos = new PVector(x, y);
    lasers = new Laser[100];
    enemies = new Enemy[50];
  }
  
  void show(){
    drawSpaceShip();
    drawHealthBar(); //<>//
    drawKillText();
  }
  
  boolean update(){
    pos.add(new PVector(mouseX-pos.x, mouseY-pos.y).mult(smooth));
    if(count > 0)
      count--;
    
    //Shooting
    if(mousePressed){
      if(count <= 0){
        shoot();
        count = cooldown;
      }
    }
    
    for(int i = 0; i < laserCount; i++){
      //if selected laser doesnt exist
      if(lasers[i] == null){
        for(int j = i; j < laserCount-1; j++){
          lasers[j] = lasers[j+1];
        }
        lasers[laserCount--] = null;
        continue;
      }//end of if selected laser doesnt exist
        
      //Check if laser is out of bounds
      lasers[i].pos.x += laserSpeed;
      if(lasers[i].pos.x > width+lasers[i].w/2){
        lasers[i] = null;
        for(int j = i; j < laserCount-1; j++){
          lasers[j] = lasers[j+1];
        }
        lasers[laserCount--] = null;
        continue;
      }//end of checking if laser is out of bounds
      
      //checking enemy collisin with laser
      for(int j = 0; j < enemyCount; j++){
        if(enemies[j] == null){continue;}
        if(lasers[i] == null){continue;}
        
        Laser laser = lasers[i];
        Enemy enemy = enemies[j];
        
        boolean okX = false;
        float lpxmax = laser.pos.x+laser.w/2;
        float lpxmin = laser.pos.x-laser.w/2;
        float epxmax = enemy.pos.x+enemy.w/2;
        float epxmin = enemy.pos.x-enemy.w/2;
        if(lpxmax >= epxmin && lpxmin <= epxmax){
          okX = true;
        }
        boolean okY = false;
        float lpymax = laser.pos.y+laser.h/2;
        float lpymin = laser.pos.y-laser.h/2;
        float epymax = enemy.pos.y+enemy.h/2;
        float epymin = enemy.pos.y-enemy.h/2;
        if(lpymax > epymin && lpymin < epymax){
          okY = true;
        }
        
        if(okX && okY){
          //deleting enemy and laser
          enemies[j]=null;
          lasers[i]=null;
          for(int k = j; k < enemyCount-1; k++){
            enemies[k] = enemies[k+1];
          }
          enemies[enemyCount--] = null;
          
          for(int k = i; k < laserCount-1; k++){
            lasers[k] = lasers[k+1];
          }
          lasers[laserCount--] = null;
          killCount++;
          background(0);
        }
      }//end of checking enemy collisin with laser
      
      if(lasers[i] != null)
        lasers[i].show();
    }//end of looping trough lasers and checking everything with lasers
    
    //updating enemies    
    for(int i = 0; i < enemyCount; i++){
      if(enemies[i] == null){continue;}
      
      //checking if enemy attacked base
      if(enemies[i].pos.x + enemies[i].w/2 <= 0 ){
        //enemy attacked base
        damage(enemies[i].damage);
        enemies[i] = null;
        for(int j = i; j < enemyCount-1; j++){
          enemies[j] = enemies[j+1];
        }
        enemies[enemyCount--] = null;
      }//end of checking if enemy attacked base
      
      //Checking enemy collision with player
      if(checkEnemyPlayerCollision(enemies[i])){
        damage(enemies[i].damage);
        enemies[i] = null;
        for(int j = i; j < enemyCount-1; j++){
          enemies[j] = enemies[j+1];
        }
        enemies[enemyCount--] = null;
        killCount++;
      }
      //End of checking enemy collision with player
      
      enemies[i].update();
      enemies[i].show();
    }
    
    //Spawning enemies
    if(frameCount%(50*spawnTimeSpan) == 0){
      float xpos = width+width/12;
      float ypos = random(height/12, height-height/12);
      float spd = 3;
      int mode = int(random(2));
      enemies[enemyCount++] = new Enemy(xpos, ypos, spd, mode);
    }//End of spawning enemies
    
    if(checkIfDead()){
      return false;
    }
    return true;
  }//end of update
  
  void shoot(){
    for(int i = ++laserCount; i > 0; i--){
      lasers[i] = lasers[i-1];
    }
    lasers[0] = new Laser(pos.x, pos.y);
  }
  
  void damage(int d){
    health -= d;
    health = constrain(health, 0, 100);
    background(255);
    if(health <= 0){
      endGame();
    }
  }
  
  boolean checkIfDead(){
    if(health <= 0){
      endGame();
      return true;
    }
    return false;
  }
  
  void endGame(){
    noLoop();
    background(51);
    
    //drawing kills and health text
    noStroke();
    fill(255);
    textSize(60);
    float x1 = width/2 - textWidth("Game over!")/2;
    float y1 = height/2 - 10;
    float x2 = width/2 - textWidth("Kills: " + killCount)/2;
    float y2 = height/2 + 70;
    text("Game over!", x1, y1);
    text("Kills: " + killCount, x2, y2);
  }
  
  void drawSpaceShip(){
    noStroke();
    fill(50, 220, 150);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
  
  void drawHealthBar(){
    rectMode(CORNER);
    stroke(255);
    strokeWeight(3);
    noFill();
    float textW = textWidth("Health ");
    rect(10+textW, 20, 200, 20);
    noStroke();
    fill(250, 50, 50);
    float healthBarWidth = map(health, 0, 100, 0, 200);
    healthBarWidth = constrain(healthBarWidth, 0, 200);
    rect(10+textW, 20, healthBarWidth, 20);
    noStroke();
    fill(255);
    textSize(30);
    text("Health ", 10, 40);
    textSize(20);
    text(""+health, textW+220, 37.5);
  }
  
  void drawKillText(){
    noStroke();
    fill(255);
    textSize(30);
    text("Kills: " + killCount, 10, 80);
  }
  
  boolean checkEnemyPlayerCollision(Enemy e){
    float pxmax = pos.x + w/2;
    float pxmin = pos.x - w/2;
    float pymax = pos.y + h/2;
    float pymin = pos.y - h/2;
    
    float exmax = e.pos.x + e.w/2;
    float exmin = e.pos.x - e.w/2;
    float eymax = e.pos.y + e.h/2;
    float eymin = e.pos.y - e.h/2;
    
    if(pxmax > exmin && pxmin < exmax){
      if(pymax > eymin && pymin < eymax){
        return true;
      }
    }
    
    return false;
  }
}