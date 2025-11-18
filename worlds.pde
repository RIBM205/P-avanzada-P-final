class World1{
  int size_x = 1000;
  int size_y = 1000;

  Floor[] floors = {
      new Floor(300, 500, 6000, 100),
      new Floor(600, 400, 100, 100),
      new Floor(900, 350, 100, 200),
      new Floor(1200, 400, 100, 100)
  };
void transform(){
  if (j1.onBorderRigth == 1 && j1.wasd[3] == 1) {
    for (Floor f : wor1.floors) {
      f.x -= 10;
    }
  }
  
  if (j1.onBorderLeft == 1 && j1.wasd[1] == 1) {
    for (Floor f : wor1.floors) {
      f.x += 10;
    }
  }
  
}

  
  void draw(){
    transform();
    for (Floor f : wor1.floors) {
      f.draw();
    }
    
  }
}
