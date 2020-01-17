import fisica.*;

color red = color(255, 0, 0);
color blue = color(0, 222, 245);
color green = color(28, 255, 0);

FWorld world;
FBox makeplatform1, makeplatform2, wall1, wall2, centre;
FCircle lplayer, rplayer, ball;

boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 600);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);

  makeplatform1 = new FBox(400, 100);
  makeplatform1.setFillColor(blue);
  makeplatform1.setNoStroke();
  makeplatform1.setPosition(200, 550);
  makeplatform1.setStatic(true);
  makeplatform1.setFriction(0);
  world.add(makeplatform1);

  makeplatform2 = new FBox(400, 100);
  makeplatform2.setFillColor(red);
  makeplatform2.setNoStroke();
  makeplatform2.setPosition(600, 550);
  makeplatform2.setStatic(true);
  makeplatform2.setFriction(0);
  world.add(makeplatform2);

  centre = new FBox(20, 250);
  centre.setFillColor(green);
  centre.setNoStroke();
  centre.setPosition(400, 550);
  centre.setStatic(true);
  centre.setFriction(0);
  world.add(centre);

  lplayer = new FCircle(100);
  lplayer.setFillColor(red);
  lplayer.setNoStroke();
  lplayer.setPosition(200, 400);
  world.add(lplayer);

  rplayer = new FCircle(100);
  rplayer.setFillColor(blue);
  rplayer.setNoStroke();
  rplayer.setPosition(600, 400);
  world.add(rplayer);
}


void draw() {
  background(255);
  world.step();
  world.draw();

  if (dkey) lplayer.addImpulse(30, 0);
  if (akey) lplayer.addImpulse(-30, 0);
  if (wkey) lplayer.addImpulse(0, -1000);
  if (skey) lplayer.addImpulse(0, 0);
}

void keyPressed() {
  if (key == 'w')  wkey = true;
  if (key == 's') skey = true;
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
}

void keyReleased() {
  if (key == 'w')  wkey = false;
  if (key == 's') skey = false;
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
}
