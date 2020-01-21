import fisica.*;

color red = color(255, 0, 0);
color blue = color(0, 222, 245);
color green = color(28, 255, 0);
color white = color(255, 0, 0);

FWorld world;
FBox makeplatform1, makeplatform2, wall1, wall2, roof, centre;
FCircle lplayer, rplayer, ball;

boolean wkey, akey, skey, dkey;
boolean cooldown1, cooldown2;

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

  wall1 = new FBox (20, height);
  //wall1.setFillColor(red);
  wall1.setNoStroke();
  wall1.setPosition(-20, height/2);
  wall1.setStatic(true);
  wall1.setFriction(0);
  world.add(wall1); 

  wall2 = new FBox (20, height);
  //wall2.setFillColor(blue);
  wall2.setNoStroke();
  wall2.setPosition(width+20, height/2);
  wall2.setStatic(true);
  wall2.setFriction(0);
  world.add(wall2);

  roof = new FBox (width, 20);
  //roof.setFillColor(green);
  roof.setNoStroke();
  roof.setPosition(width/2, 0);
  roof.setStatic(true);
  roof.setFriction(0);
  world.add(roof);

  ball = new FCircle(20);
  ball.setFillColor(white);
  ball.setPosition(width/2, 100);
  ball.setRestitution(1);
  world.add(ball);

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

  FPoly p = new FPoly();
  p.vertex(50, 700*0.6);
  p.vertex(50, 700*0.8-130);
  p.vertex(400, 700*0.8-85);
  p.vertex(450, 700*0.6+50);

  // define properties
  p.setStatic(true);
  p.setFillColor(white);
  p.setFriction(0);

  //put it in the world
  world.add(p);
}

void draw() {
  background(255);

  cooldown1 = false;
  ArrayList<FContact> contacts = lplayer.getContacts();
  int i = 0;
  while (i < contacts.size()) {
    FContact c = contacts.get(i);
    if (c.contains(makeplatform1)) cooldown1 = true;
    i++;
  }

  if (wkey && cooldown1) lplayer.addImpulse(0, -5000);
  if (akey) lplayer.addImpulse(-100, 0);
  if (dkey) lplayer.addImpulse(100, 0);

  world.step();
  world.draw();
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
