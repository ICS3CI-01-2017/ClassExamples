// player variables
float playerX, playerY, playerW, playerH;

// block variables
float blockX, blockY, blockW, blockH;

// control variables
boolean right, left, up, down;


void setup(){
  size(800, 600);
  
  // initial player position
  playerX = 100;
  playerY = 250;
  playerW = 75;
  playerH = 100;
  
  // block position
  blockX = 375;
  blockY = 275;
  blockW = 50;
  blockH = 50;
  
  // control values
  right = false;
  left = false;
  down = false;
  up = false;
}


void draw(){
  // black background
  background(0);
  
  // draw block
  // blue fill
  fill(0,0,255);
  rect(blockX, blockY, blockW, blockH);
  
  // draw the player
  // red fill
  fill(255,0,0);
  rect(playerX, playerY, playerW, playerH);
  
  // player controls
  if(right){
    playerX = playerX + 3;
  }else if(left){
    playerX = playerX - 3;
  }
  
  if(up){
    playerY = playerY - 3;
  }else if(down){
    playerY = playerY + 3;
  }
  
  if(collides(playerX, playerY, playerW, playerH, blockX, blockY, blockW, blockH)){
    fill(0,255,0);
    rect(100,100,100,100);
  }
  
}

// runs any time a key is pressed
void keyPressed(){
  // set the appropriate action based on the key
  if(key == 'a'){
    left = true;
  }else if(key == 'd'){
    right = true;
  }else if(key == 'w'){
    up = true;
  }else if(key == 's'){
    down = true;
  }
}

// runs any time a key is released
void keyReleased(){
  if(key == 'a'){
    left = false;
  }else if(key == 'd'){
    right = false;
  }else if(key == 'w'){
    up = false;
  }else if(key == 's'){
    down = false;
  }
}

boolean collides(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2){  
  // not colliding?
  if(x1 + w1 < x2 || x1 > x2 + w2 || 
     y1 + h1 < y2 || y1 > y2 + h2){
      // send the answer of NO
      return false;
  }else{
      // send the answer of YES
      return true;
  }
  
}