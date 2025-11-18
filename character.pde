
class Character{
  int type; //0 enemigo , 1 jugador
  float x,y;
  int hitbox_x = 100;
  int hitbox_y = 100;
  int onGround = 0;
  int onBorderRigth = 0;
  int onBorderLeft = 0;
  float prevX, prevY;
   void move(float in_x, float in_y){
      prevX = x;   
     prevY = y;
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
    
    if (key == 'w') {
      wasd[0] = 1;
      if (onGround == 1 && jump == 0) {
        jump = 1;
        jumpMillis = millis();
      }
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
  
int jump() {

  if (jump == 1 && millis() - jumpMillis < 200) {
    acel = -10;  
  } else {
    jump = 0;
    if (onGround == 0) {
      acel += gravity;      
    } else {
      acel = 0;       
    }
  }

  return int(acel);
}

  
    void handlers() {
      onGround = 0;
    
      float left   = x;
      float right  = x + hitbox_x;
      float top    = y;
      float bottom = y + hitbox_y;
    
      for (Floor f : wor1.floors) {
        float fLeft   = f.x - f.w/2;
        float fRight  = f.x + f.w/2;
        float fTop    = f.y - f.h/2;
        float fBottom = f.y + f.h/2;
    
        boolean overlap = right > fLeft && left < fRight &&
                          bottom > fTop && top < fBottom;
        if (!overlap) continue;
    
        float overlapRight  = right  - fLeft;
        float overlapLeft   = fRight - left;
        float overlapBottom = bottom - fTop;
        float overlapTop    = fBottom - top;
    
        float minOverlapX = min(overlapRight, overlapLeft);
        float minOverlapY = min(overlapBottom, overlapTop);
    
 
        if (minOverlapX < minOverlapY) {
          // colisión horizontal
          if (overlapRight < overlapLeft) {
            x -= overlapRight;    
          } else {
            x += overlapLeft;     
          }
        } else {
   
          if (overlapBottom < overlapTop) {
            y -= overlapBottom;    
            onGround = 1;
          } else {
            y += overlapTop;      
          }
        }
    
        left   = x;
        right  = x + hitbox_x;
        top    = y;
        bottom = y + hitbox_y;
      }
    
      if (x + (hitbox_x/2) >= 400) onBorderRigth = 1;
      else onBorderRigth = 0;
    
      if (x <= 100) onBorderLeft = 1;
      else onBorderLeft = 0;
    }



  
  void update_move(){
    float out_x = 0 ,out_y = 0;
    
    int j = jump();
    if(wasd[1] == 1 && onBorderLeft != 1) out_x -= 10;
    if(wasd[2] == 1) out_y += 10;
    if(wasd[3] == 1 && onBorderRigth != 1) out_x += 10;
    
    this.move(out_x,out_y + j);
    println("ground stats: %d",onGround);
    println("acel %d ",j);
    println("moving outX: %f , outY: %f",out_x,out_y + j);
  }
    void draw(){
      this.update_move();
      handlers();
      fill(153);
      quad(this.x,this.y,
           this.x+this.hitbox_x,this.y,
           this.x+this.hitbox_x,this.y+this.hitbox_y,
           this.x,this.y+this.hitbox_y);
    }
} 
