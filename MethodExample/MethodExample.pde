float playerX;
float playerY;
float playerDirection;
float playerSpeed;

void setup(){
  size(800,600);
  // create player values
  playerX = 200;
  playerY = 200;
  playerSpeed = 5;
  playerDirection = 1;
}

void draw(){
  playerX = playerX + playerDirection*playerSpeed;
  if(playerX > width){
    playerDirection = -1;
  }else if(playerX < 0){
    playerDirection = 1;
  }
  
  // black background
  background(0,0,0);
  // calls our method to draw the mouse
  drawMouse(playerX,playerY);
  drawMouse(400,500);
  drawMouse(700,300);
  drawMouse(mouseX, mouseY);
}


void drawMouse(float x, float y){
  // white filled shapes
  fill(255,255,255);
  
  // change the ellipse drawing mode
  ellipseMode(CENTER);
  // turn off the outline
  noStroke();
  // draw the head of Mickey
  ellipse(x,y,250,250);
  // drawing the left ear
  ellipse(x - 250/2,y - 250/2, 120, 120);
  // drawing the right ear
  ellipse(x + 250/2,y - 250/2, 120, 120);
  // change colour to black
  fill(0,0,0);
  // left eye
  ellipse(x - 50, y - 50, 50, 75);
  // right eye
  ellipse(x + 50, y - 50, 50, 75);
}