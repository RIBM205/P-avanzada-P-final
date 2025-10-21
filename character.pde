
class Character{
  int type; //0 enemigo , 1 jugador
  float x,y;
  int hitbox_x = 100;
  int hitbox_y = 100;
   void move(float in_x, float in_y){
     x += in_x;
     y += in_y;
   }
   
}

class Jugador extends Character{
  int wasd[] = {0,0,0,0};
  int gravity = 1;
  Jugador(float _x, float _y){
       x = _x;
       y = _y;
  }
  void buton_pressed_handler(){
    //print("boton presionado: ", key);
    
    if(key == 'w'){
      wasd[0] = 1;
    }
    else if(key == 'a'){
      wasd[1] = 1;
    }
    else if(key == 's'){
      wasd[2] = 1;
    }
    else if(key == 'd'){
      wasd[3] = 1;
     // print("d en 1");
    }
  }
  void button_released_handler(){
    //print("boton soltado: ", key);
    if(key == 'w'){
      wasd[0] = 0;
    }
    else if(key == 'a'){
      wasd[1] = 0;
    }
    else if(key == 's'){
      wasd[2] = 0;
    }
    else if(key == 'd'){
      wasd[3] = 0;
    }
  }
  
  void update_move(){
    float out_x = 0 ,out_y = 0;
    
    if(wasd[0] == 1) out_y -= 10;
    if(wasd[1] == 1) out_x -= 10;
    if(wasd[2] == 1) out_y += 10;
    if(wasd[3] == 1) out_x += 10;
    
    this.move(out_x,out_y + gravity);
    println("moving outX: %f , outY: %f",out_x,out_y);
  }
  void draw(){
    this.update_move();
    fill(153);
    quad(this.x,this.y,this.x+this.hitbox_x,this.y,this.x+this.hitbox_x,this.y+this.hitbox_y,this.x,this.y+this.hitbox_y);
  }
} 
