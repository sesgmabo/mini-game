class Tictactoe extends Screen {
  int[][] board;
  int player = 1;
  int winner = 0;
  PFont f;
  int chk;
  int cnt;
  int play;

//istedet for setup
  Tictactoe() {
    //size(600, 600);
    f = createFont("Arial", 16, true);
    board = new int[3][3];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = 0;
      }
    }
    play = 1;
  }

//istedet for draw
  void show() {
    background(255, 255, 255);
    if (play != 0) {
      drawBoard();
      if (winner==0) {
        drawMarks();
      }
      chk();
      declare();
      if (mousePressed) {
        valid();
      }
    }
  }

  void chk() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 0) {
        winner = board[i][0];
      }
      if (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != 0) {
        winner = board[0][i];
      }
    }
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[1][1] != 0) {
      winner = board[0][0];
    }
    if (board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[1][1] != 0) {
      winner = board[2][0];
    }
    cnt = 0;
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        if (board[j][k] == 0) {
          cnt++;
        }
      }
    }
    if (cnt == 0 && winner == 0) {
      winner = 2;
    }
  }

  String msg;

  void valid () {
    int x = mouseX / 200;
    int y = mouseY / 200;
    if (x < 3 && y < 3 && board[y][x] == 0) {
      board[y][x] = player;
      player = -1 * player;
    }
  }

void declare() {
    if (winner != 0 && winner != 2) {
        textFont(f, 48);
        fill(0);
        textAlign(CENTER);
        if (winner == 1) {
            msg = "X wins";
        } else if (winner == -1) {
            msg = "O wins";
        }
        text(msg, 300, 300);
    }
    if (winner == 2) {
        textFont(f, 16);
        fill(0);
        textAlign(CENTER);
        msg = "Draw";
        text(msg, 300, 300);
    }
}

  void drawBoard() {
    strokeWeight(7);
    for (int i = 1; i <= 2; i++) {
      line(10, i * 200, 590, i * 200);
      line(i * 200, 10, i * 200, 590);
    }
  }

void drawX(int x, int y) {
    stroke(255, 0, 0); 
    float offset = 25;
    line(x * 200 + offset, y * 200 + offset, x * 200 + 200 - offset, y * 200 + 200 - offset);
    line(x * 200 + 200 - offset, y * 200 + offset, x * 200 + offset, y * 200 + 200 - offset);
    stroke(0);
}

void drawO(int x, int y) {
    stroke(0, 0, 255); 
    ellipse(x * 200 + 100, y * 200 + 100, 175, 175);
    fill(255,255,255);
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
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        locator(x, y);
      }
    }
  }
}
