void mousePressed() {
  if (mode == GAME) gameclicks();
  else if (mode ==GAMEOVER1) gameoverclicks1();
  else if (mode ==GAMEOVER2) gameoverclicks2();
  else if (mode == PAUSE) pauseclicks();
}
