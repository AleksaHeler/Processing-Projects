class CarRow{
  Car[] cars;
  float y;
  float speed;
  
  CarRow(int carCount, float y, float s){
    this.y = y;
    this.speed = s;
    
    cars = new Car[carCount];
    for(int i = 0; i < cars.length; i++){
      float x = floor(random(0, xresolution))*grid;
      cars[i] = new Car(x, y, grid*2, grid, speed);
    }
  }
  
  void updateAndShow(){
    for(Car car : cars){
      //Animating cars
      car.update();
      car.show();
      
      //Checking collision
      if(car.intersects(frog)){
        //Car hit frog
        //println("Game Over!");
        resetGame();
      }
    }
  }
}