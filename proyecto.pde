Jugador j1 = new Jugador(50,50);
ElapsedMillis time_handler = new ElapsedMillis();
Floor f1 = new Floor(100,100,100,100);
World1 wor1 = new World1();
void keyPressed(){
  j1.buton_pressed_handler();

}

void keyReleased(){
  j1.button_released_handler();
}
void setup(){
  
  size(600, 600);

}

void draw(){
  background(1);
  clear();
//  float print_time = time_handler.seconds();
  //println(print_time);
  time_handler.restart();
  j1.draw();
  wor1.draw();
}
