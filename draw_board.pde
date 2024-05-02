void drawBoard(){
  strokeWeight(7);
  for (int i= 1; i<3; i = i+1){
    line (0,i*200, 600, i*200);
    line (i*200,0,i*200,600);
  }
}

int x, y;

void drawX(int x,int y){
  line(x*200,y*200,x*200+200,y*200+200);
  line(x*200+200,y*200,x*200,y*200+200);
}

void locator(){
  x = mouseX;
  y = mouseY;
  x = x/200;
  y = y/200;
  drawX(x,y);
}

////test//
