
void setup(){
  size(800,600);
}

void draw(){
  // black background
  background(0,0,0);
  // white filled shapes
  fill(255,255,255);
  
  // change the ellipse drawing mode
  ellipseMode(CENTER);
  // turn off the outline
  noStroke();
  // draw the head of Mickey
  ellipse(400,300,250,250);
  // drawing the left ear
  ellipse(400 - 250/2,300 - 250/2, 120, 120);
  // drawing the right ear
  ellipse(400 + 250/2,300 - 250/2, 120, 120);
  // change colour to black
  fill(0,0,0);
  // left eye
  ellipse(400 - 50, 300 - 50, 50, 75);
  // right eye
  ellipse(400 + 50, 300 - 50, 50, 75);
}