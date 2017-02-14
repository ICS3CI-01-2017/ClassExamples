void setup(){
  // Makes a window that is 800px X 600px
  size(800,600);
}

void draw(){
  stroke(0,0,0);
  // draw a point at (400,300)
  point(400,300);
  
  // draw a line from (100,50) to (500,300)
  line(100,50,500,300);
  
  fill(232,54,223);
  // draw a rectangle top corner at (100,500) 
  // width of 100, height of 50
  rect(100, 500, 100, 50);
  
  fill(255,118,5);
  // draws a triangle
  triangle(750, 550, 790, 500, 765, 400);
  //quad(750, 550, 790, 500, 765, 400, 300, 200);
  
  // change the drawing point for an ellipse
  ellipseMode(CENTER);
  // draw an ellipse centered at (400,300)
  // that is 100 wide and 50 tall
  ellipse(400,300, 100, 50);
  
  noStroke();
  fill(249,250,0);
  // arc centered at (600,100)
  // 75 width by 75 tall
  // starting at 45 degrees 
  // ending at 315 degrees
  arc(600, 100, 75, 75, radians(45), radians(315) );
}