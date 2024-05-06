Screen currScreen;

void setup(){
  size(1200, 720);
  
  currScreen = new MainMenu();
}

void draw(){
  currScreen.show();
}


void mousePressed() {
  currScreen.getInput();
}
