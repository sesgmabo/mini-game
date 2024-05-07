class MainMenu extends Screen {
 PImage img1;
PImage img2;
boolean isHoveringRect1 = false;
boolean isHoveringRect2 = false;
boolean isHoveringRect3 = false;
float rainbowOffset = 0; 
//Screen currScreen;

int state = 0;

MainMenu(){
 img1 = loadImage("Person.png");
  img1.resize(175, 175);
  img2 = loadImage("settingsicon.png");
  img2.resize(125, 125);
  
  //currScreen = new Menu(); 
}

void show(){
   //currScreen.show();
 // if state = 1
 //   snake.show();
 // if state == 0
  isHoveringRect1 = mouseX > 360 && mouseX < 540 && mouseY > height/2 - 200 && mouseY < height/2 + 200;
  isHoveringRect2 = mouseX > 610 && mouseX < 790 && mouseY > height/2 - 200 && mouseY < height/2 + 200;
  isHoveringRect3 = mouseX > 860 && mouseX < 1040 && mouseY > height/2 - 200 && mouseY < height/2 + 200;
  
  if (isHoveringRect1) {
    background(255, 0, 0); 
  } else if (isHoveringRect2) {
    background(0, 255, 0); 
  } else if (isHoveringRect3) {
    background(0, 0, 255); 
  } else {
    
    rainbowOffset += 0.05; 
    drawRainbowBackground();
  }
  
  noFill(); 
  stroke(0); // Set outline color to black
  
  rectMode(CENTER);
  circle(170, height/2, 230);
  image(img1, 85, 270);
  image(img2, 105, 500);
  rect(450, height/2, 180, 400, 28);
  rect(700, height/2, 180, 400, 28);
  rect(950, height/2, 180, 400, 28);
  
  drawTextBox(180, 220, "Hovedmenu");
  drawTextBox(450, 145, "TicTacToe");
  drawTextBox(700, 145, "Memory Match");
  drawTextBox(950, 145, "Snake");
  
 
  if (isHoveringRect1 || isHoveringRect2 || isHoveringRect3) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void drawTextBox(float x, float y, String text) {
  noFill(); 
  stroke(0); 
  fill(0); 
  textAlign(CENTER, CENTER);
  textSize(25);
  text(text, x, y);
}

void drawRainbowBackground() {

  for (int i = 0; i < width; i++) {
    float r = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width);
    float g = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width + TWO_PI / 3);
    float b = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width + 2 * TWO_PI / 3);
    stroke(r, g, b);
    line(i, 0, i, height);
  } 
}

void getInput(){
 if (isHoveringRect1) {
  
    Tictactoe ticTacToe = new Tictactoe();
    currScreen = ticTacToe;
  } else if (isHoveringRect2) {
   
    Memorymatch memorymatch = new Memorymatch();
    currScreen = memorymatch;
  } else if (isHoveringRect3) {
    
    Snake snake = new Snake();
    currScreen = snake;
  } 
}
  
  
}
