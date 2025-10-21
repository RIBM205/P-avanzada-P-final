

class ElapsedMillis{
  int timer = millis(); 
  int reboot = 0;
  
  int time(){
    return timer - reboot;
  }
  float seconds(){
    timer = millis();
  return (float(timer - reboot)) / 1000;
  }
  void restart(){
    reboot = millis();
  }
  void update(){
  timer = millis();
}
}
