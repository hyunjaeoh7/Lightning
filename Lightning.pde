//i spent too long on this assignment
//init velo is the initial velocity/overall y velocity of the lava
int initVelo = 30;
//this changes the color of the lava over time by adding more green to it
int greenValue = 30;
//initializes the dictionary used to organize all the lavas
IntDict allLavas;


void setup()
{
  allLavas = new IntDict();
  //rightmost lower lava
  allLavas.set("lava1StartX", 201);
  allLavas.set("lava1StartY", 220);
  allLavas.set("lava1EndX", allLavas.get("lava1StartX"));
  allLavas.set("lava1EndY", allLavas.get("lava1StartY"));
  
  //rightmost higher lava
  allLavas.set("lava2StartX", 201);
  allLavas.set("lava2StartY", 220);
  allLavas.set("lava2EndX", allLavas.get("lava2StartX"));
  allLavas.set("lava2EndY", allLavas.get("lava2StartY"));
  
  //leftmost lower lava
  allLavas.set("lava3StartX", 178);
  allLavas.set("lava3StartY", 218);
  allLavas.set("lava3EndX", allLavas.get("lava3StartX"));
  allLavas.set("lava3EndY", allLavas.get("lava3StartY"));
  
  //leftmost higher lava
  allLavas.set("lava4StartX", 178);
  allLavas.set("lava4StartY", 218);
  allLavas.set("lava4EndX", allLavas.get("lava4StartX"));
  allLavas.set("lava4EndY", allLavas.get("lava4StartY"));
  
  //size, stroke, background and stuff plus the no loop thing
  size(500, 500);
  noStroke();
  background(180, 180, 180);
  fill(255, 150, 0);
  noLoop();
}
void draw()
{
  noStroke();
  //lava
  fill(250,30,0);
  rect(168,216,50,40);
  
  //volcano
  fill(46,41,58);
  beginShape();
  vertex(47,420);
  vertex(78, 340);
  vertex(97, 305);
  vertex(130, 247);
  vertex(167, 211);
  vertex(188,234);
  vertex(206,227);
  vertex(213,206);
  vertex(257,238);
  vertex(292,289);
  vertex(324,334);
  vertex(350,400);
  endShape();
  
  //ground
  fill(130, 130, 130);
  beginShape();
  vertex(0, 432);
  vertex(100, 387);
  vertex(223, 352);
  vertex(345, 379);
  vertex(500, 378);
  vertex(500, 500);
  vertex(0, 500);
  endShape();

  //lava lightning shooting out thing
  stroke(250,greenValue,0);
  strokeWeight(10);
  
  //changes the ending x and y values by a random amount for the rightside lavas
  for(int i = 1; i <= 2; i++){
    allLavas.add("lava" + i + "EndX", (int)(Math.random()*8)+6);
    allLavas.add("lava" + i + "EndY", (int)(Math.random()*4) - (initVelo * i));
  }
  
  //same thing as above but for the left side lavas
  for(int i = 3; i <= 4; i++){
    allLavas.sub("lava" + i + "EndX", (int)(Math.random()*8)+6);
    allLavas.add("lava" + i + "EndY", (int)(Math.random()*4) - (initVelo * (i-2)));
  }
  
  //creates the four lines for all of the lava shooting out
  for(int i = 1; i <= 4; i++){
    line(allLavas.get("lava" + i + "StartX"), allLavas.get("lava" + i + "StartY"), allLavas.get("lava" + i + "EndX"), allLavas.get("lava" + i + "EndY"));
  }
  
  //changes the y velocity by a random amount
  initVelo -= (int)(Math.random() * 3) + 3;
  
  //changes the green color by a set amount
  greenValue += 10;
  
  //sets all the starting x and y values to the ending x and y values
  for(int i = 1; i <= 4; i++){
    allLavas.set("lava" + i + "StartX", allLavas.get("lava" + i + "EndX"));
    allLavas.set("lava" + i + "StartY", allLavas.get("lava" + i + "EndY"));
  }
}
void mousePressed()
{
  redraw();
}
