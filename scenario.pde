class Floor{
  int x = 0;
  int y = 0;
  int w = 0;
  int h = 0;
  Floor(int _x ,int _y , int _w ,  int _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  

 void draw(){
   fill(255);
   rect(x -(w /2),y - (h/2),w,h);
 }
}
