PImage img1;
PImage img2;
boolean isHoveringRect1 = false;
boolean isHoveringRect2 = false;
boolean isHoveringRect3 = false;
float rainbowOffset = 0; 

void setup(){
  size(1200, 720);
  img1 = loadImage("Person.png");
  img1.resize(175, 175);
  img2 = loadImage("settingsicon.png");
  img2.resize(125, 125);
}

void draw(){
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
  
  // Change cursor appearance based on hovering status
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
  // Draw smooth and flowing rainbow background
  for (int i = 0; i < width; i++) {
    float r = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width);
    float g = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width + TWO_PI / 3);
    float b = 127 + 127 * sin(rainbowOffset + TWO_PI * i / width + 2 * TWO_PI / 3);
    stroke(r, g, b);
    line(i, 0, i, height);
  }
}

void mousePressed() {
  if (isHoveringRect1) {
    // Open TicTacToe class
    TicTacToe ticTacToe = new TicTacToe();
    ticTacToe.setup();
  } else if (isHoveringRect2) {
    // Open MemoryMatch class
    MemoryMatch memoryMatch = new MemoryMatch();
    memoryMatch.setup();
  } else if (isHoveringRect3) {
    // Open Snake class
    Snake snake = new Snake();
    snake.setup();
  }
}
