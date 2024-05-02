int [][] board; 
int player = 1; 

void setup (){
  size (600, 600);
  board = new int [3][3];
  for (int i = 0; i<3; i++){
    for (int j = 0; j<3; j++){
      board [i][j] = 0;
    }
  }
}

void draw(){
  background(255,255,255);
  drawBoard();
  locator();
}
