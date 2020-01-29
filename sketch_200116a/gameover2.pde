void gameover2() {
  fill(255);
  rect(0, 0, 800, 600);
  fill(0);
  text("GameOver Red Wins", width/2, height/2);
  point = 0;
  points = 0;
}



void gameoverclicks2() {
  mode = GAME;
}
