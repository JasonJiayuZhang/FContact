void game() {
  background(255);
  image(img2, 0, 0);
  fill(0);
  text("Point: "+point, 120, 60);
  text("Point: "+points, 680, 60);



  cooldown1 = false;
  ArrayList<FContact> contacts1 = lplayer.getContacts();
  int i = 0;
  while (i < contacts1.size()) {
    FContact c = contacts1.get(i);
    if (c.contains(makeplatform1)) cooldown1 = true;
    i++;
  }

  cooldown2 = false;
  ArrayList<FContact> contacts2 = rplayer.getContacts();
  int k = 0;
  while (k < contacts2.size()) {
    FContact b = contacts2.get(k);
    if (b.contains(makeplatform2)) cooldown2 = true;
    k++;
  }

  gameover = false;
  ArrayList<FContact> contact1 = makeplatform2.getContacts();
  int n = 0;
  while (n < contact1.size()) {
    FContact b = contact1.get(n);
    if (b.contains(makeplatform2)) gameover = true;
    n++;
  }

  gameover = false;
  ArrayList<FContact> contact2 = makeplatform1.getContacts();
  int t = 0;
  while (t < contact2.size()) {
    FContact b = contact2.get(t);
    if (b.contains(makeplatform1)) gameover = true;
    t++;
  }


  for (FContact o : contact2) {
    if (o.contains(ball)) {
      points++;
      world.remove(ball);
      world.remove(lplayer);
      lplayer.setStatic(true);
      lplayer.setPosition(200, 400);
      rplayer.setPosition(600, 400);
      lplayer.setForce(0, 0);
      lplayer.setVelocity(0, 0);
      world.add(lplayer);
      lplayer.setStatic(false);
      ball.setPosition(600, 100);
      world.add(ball);
    }
  }

  for (FContact o : contact1) {
    if (o.contains(ball)) {
      point++;
      world.remove(ball);
      world.remove(rplayer);
      rplayer.setStatic(true);
      lplayer.setPosition(200, 400);
      rplayer.setPosition(600, 400);
      rplayer.setForce(0, 0);
      rplayer.setVelocity(0, 0);
      world.add(rplayer);
      rplayer.setStatic(false);
      ball.setPosition(200, 100);
      world.add(ball);
    }
  }

  if (wkey && cooldown1) lplayer.addImpulse(0, -5000);
  if (akey) lplayer.addImpulse(-500, 0);
  if (dkey) lplayer.addImpulse(500, 0);

  if (up && cooldown2) rplayer.addImpulse(0, -5000);
  if (left) rplayer.addImpulse(-500, 0);
  if (right) rplayer.addImpulse(500, 0);

  if (lplayer.getX() > width/2-lplayer.getSize()/2) {
    lplayer.setPosition(width/2-lplayer.getSize()/2, lplayer.getY());
  }
  if (rplayer.getX() < width/2+rplayer.getSize()/2) {
    rplayer.setPosition(width/2+rplayer.getSize()/2, rplayer.getY());
  }

  if (points > 3) {
    mode = GAMEOVER1;
  }

  if (point > 3) {
    mode = GAMEOVER2;
  }

  world.step();
  world.draw();
}

void gameclicks() {
}
