import fisica.*;

color red = color(255, 0, 0);
color blue = color(0, 222, 245);
color green = color(0, 245, 100);

//Fcircle, lplayer, rplayer, ball;
FWorld world;
//FBox makeplatform1, makeplatform2, wall1, wall2, centre;
//Fcircle lplayer, rplayer, ball;

boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 600);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);

  FBox a = new FBox(400, 100);
  a.setFillColor(blue);
  a.setNoStroke();
  a.setPosition(200, 550);
  a.setStatic(true);
  a.setFriction(0);
  world.add(a);

  FBox b = new FBox(400, 100);
  b.setFillColor(red);
  b.setNoStroke();
  b.setPosition(600, 550);
  b.setStatic(true);
  b.setFriction(0);
  world.add(b);


  makeplayer1();
  makeplayer2();
}


void draw() {
  background(255);
  world.step();
  world.draw();
}

void makeplayer1() {
  FCircle circle = new FCircle(50);
  circle.setPosition(500, 0);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);
  //set physical properties
  //circle.setDensity(0.2);
  //circle.setFriction(1);
  //circle.setRestitution(1);

  if (dkey){
    circle.setVelocity(10, 0);
  }

  //add to world
  world.add(circle);
}

void makeplayer2() {
  FCircle circle = new FCircle(50);
  circle.setPosition(300, 0);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(blue);

  //set physical properties
  //circle.setDensity(0.2);
  //circle.setFriction(1);
  //circle.setRestitution(1);

  //add to world
  world.add(circle);
}




//void draw(){

//  background(0);
//  leftCanJump = false;
//  ArrayList<FContact> contacts = lplayer.getContacts();

//  //int i = 0;
//  //while (i < contacts.size()){
//  //FContact c =contacts.get(i);
//  //if(c.contains(left)) leftCamJump = true;
//  //  i++;
//  //}

//  for (FContact c : contacts) {
//    if (c.contains(left)) leftCamJump = true;
//  }

//  //println(leftCanJump);
//  if (wkey&& leftCanJump) lplaayer.addImpulse(0, -5000);
//  if (akey) lplayer.addImpulse(-100, 0);
//  if (skey);
//  if (dkey) lplayer.addImpulse(100, 0);

//  world.step();
//  world.draw();
//}

//void left() {

//}

//void right() {
//}


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
