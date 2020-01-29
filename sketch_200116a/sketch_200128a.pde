import fisica.*;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

int mode;
final int GAME   = 1;
final int GAMEOVER1 = 2;
final int GAMEOVER2  = 3;
final int PAUSE  = 4;
color red = color(255, 0, 0);
color blue = color(0, 222, 245);
color green = color(28, 255, 0);
color white = color(255, 0, 0);
int point =0, points;
FWorld world;
FBox makeplatform1, makeplatform2, wall1, wall2, roof, centre;
FCircle lplayer, rplayer, ball;

boolean up, down, left, right, wkey, akey, skey, dkey, rkey;
boolean cooldown1, cooldown2, gameover;

void setup() {
  size(800, 600, P2D);
  img1 = loadImage("frag_000.jpg");
  img2 = loadImage("frag_001.jpg");
  img3 = loadImage("frag_002.jpg");
  img4 = loadImage("frag_003.jpg");


  mode = GAME;
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
  ball.setPosition(200, 100);
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
}

void draw() {
  if (mode == GAME) game();
  else if (mode == GAMEOVER1) gameover1();
  else if (mode == GAMEOVER2) gameover2();
  else if (mode == PAUSE) pauseclicks();
  else println("mode error");
}


void keyPressed() {
  if (key == 'w')  wkey = true;
  if (key == 's') skey = true;
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (key == 'w')  wkey = false;
  if (key == 's') skey = false;
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
