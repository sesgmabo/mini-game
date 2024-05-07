class Tictactoe extends Screen {
  int[][] board;
  int player = 1;
  int winner = 0;

  Tictactoe() {
    //size(600, 600);
    board = new int[3][3];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = 0;
      }
    }
  }

  void show() {
    background(255, 255, 255);
    drawBoard();
    drawMarks();
    if (mousePressed) {
      valid();
    }
  }

  int cnt;

  void check() {
    for (int i = 0; i < 3; i = i + 1) {
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 0) {
        winner = board[i][0];
      }
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != 0) {
        winner = board[0][i];
      }
      if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[1][1] != 0) {
        winner = board[0][0];
      }
      if (board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[1][1] != 0) {
        winner = board[0][0];
      }
      cnt = 0;

      for (int j = 0; j < 3; j = j + 1) {
        for (int k = 0; k < 3; k = k + 1) {
          if (board[j][k] == 0) {
            cnt = cnt + 1;
          }
        }
      }
      if (cnt == 0 && winner == 0) {
        winner = 2;
      }
    }
  }

  void valid () {
    x = mouseX;
    y = mouseY;
    y = y/200;
    x = x/200;
    if (board[y][x] == 0) {
      board[y][x] = player;
      player = -1*player;
    }
  }

  void drawBoard() {
    strokeWeight(7);
    for (int i = 1; i <= 2; i = i + 1) {
      line(10, i * 200, 590, i * 200);
      line(i * 200, 10, i * 200, 590);
    }
  }

  int x, y;

  void drawX(int x, int y) {
    line(x * 200, y * 200, x * 200 + 200, y * 200 + 200);
    line(x * 200 + 200, y * 200, x * 200, y * 200 + 200);
  }

  void drawO(int x, int y) {
    ellipse(x * 200 + 100, y * 200 + 100, 175, 175);
    fill (255,0,0);
  }

  void locator(int x, int y) {
    if (board[y][x] == 1) {
      drawX(x, y);
    }
    if (board[y][x] == -1) {
      drawO(x, y);
    }
  }

  void drawMarks() {
    for (int y = 0; y < 3; y = y + 1) {
      for (int x = 0; x < 3; x = x + 1) {
        locator(x, y);
      }
    }
  }
}
