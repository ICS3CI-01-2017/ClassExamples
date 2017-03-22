// player variables
float playerX, playerY, playerW, playerH;

// block variables
float blockX, blockY, blockW, blockH;
// block variables
float blockX2, blockY2, blockW2, blockH2;
// block variables
float blockX3, blockY3, blockW3, blockH3;


// control variables
boolean right, left, up, down;

int level;


void setup() {
  size(800, 600);

  level = 1;
  // initial player position
  playerX = 100;
  playerY = 250;
  playerW = 50;
  playerH = 100;

  // block position
  blockX = 375;
  blockY = 275;
  blockW = 150;
  blockH = 50;
  
  blockX2 = 375;
  blockY2 = 175;
  blockW2 = 50;
  blockH2 = 100;
  
  blockX3 = 375;
  blockY3 = 475;
  blockW3 = 50;
  blockH3 = 50;

  // control values
  right = false;
  left = false;
  down = false;
  up = false;
}


void draw() {
  // black background
  background(0);

  // player controls
  if (right) {
    playerX = playerX + 3;
  } else if (left) {
    playerX = playerX - 3;
  }

  if (up) {
    playerY = playerY - 3;
  } else if (down) {
    playerY = playerY + 3;
  }
  
  // level 1
  
  // draw block
  // blue fill
  fill(0, 0, 255);
  rect(blockX, blockY, blockW, blockH);
  rect(blockX2, blockY2, blockW2, blockH2);
  
  fill(255,0,255);
  rect(blockX3, blockY3, blockW3, blockH3);

  // draw the player
  // red fill
  fill(255, 0, 0);
  rect(playerX, playerY, playerW, playerH);


  // does the player hit the block
  if (collides(playerX, playerY, playerW, playerH, blockX, blockY, blockW, blockH)) {
    // call the method to fix collision
    fixCollision(blockX, blockY, blockW, blockH);
  }
  
  // does the player hit the block
  if (collides(playerX, playerY, playerW, playerH, blockX2, blockY2, blockW2, blockH2)) {
    // call the method to fix collision
    fixCollision(blockX2, blockY2, blockW2, blockH2);
  }
  
  // does the player hit the block
  if (collides(playerX, playerY, playerW, playerH, blockX3, blockY3, blockW3, blockH3)) {
      level = level + 1;  
    
      // teleport
      playerX = 100;
      playerY = 300;
      
      if(level == 2){
        blockX = 400;
        blockY = 100;
        blockW = 200;
        blockH = 50;
        
        blockX2 = 100;
        blockY2 = 100;
        blockW2 = 20;
        blockH2 = 100;
      }else if(level == 3){
        blockX = 200;
        blockY = 400;
        blockW = 10;
        blockH = 150;
        
        blockX2 = 150;
        blockY2 = 200;
        blockW2 = 70;
        blockH2 = 70;
      }
  }
  
  if(playerX + playerW < 0){
    playerX = width;
  }
  if(playerX > width){
    playerX = -playerW;
  }
  
}

// runs any time a key is pressed
void keyPressed() {
  // set the appropriate action based on the key
  if (key == 'a') {
    left = true;
  } else if (key == 'd') {
    right = true;
  } else if (key == 'w') {
    up = true;
  } else if (key == 's') {
    down = true;
  }
}

// runs any time a key is released
void keyReleased() {
  if (key == 'a') {
    left = false;
  } else if (key == 'd') {
    right = false;
  } else if (key == 'w') {
    up = false;
  } else if (key == 's') {
    down = false;
  }
}

boolean collides(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {  
  // not colliding?
  if (x1 + w1 < x2 || x1 > x2 + w2 || 
    y1 + h1 < y2 || y1 > y2 + h2) {
    // send the answer of NO
    return false;
  } else {
    // send the answer of YES
    return true;
  }
}

void fixCollision(float x1, float y1, float w1, float h1) {
  // calulate how much we are overlapping by
  float overWidth = min(playerX + playerW - x1, x1 + w1 - playerX);
  float overHeight = min(playerY + playerH - y1, y1 + h1 - playerY);

  // fix the collision on the X axis
  if (overWidth < overHeight) {
    // determine which side we are on
    if (playerX < x1) {
      // on the left, subtract to fix
      playerX = playerX - overWidth;
    } else {
      // on the right, add to fix
      playerX = playerX + overWidth;
    }
  } else {
    // fixing the Y axis
    // are we above or below the block
    if (playerY < y1) {
      // above the block, subtract
      playerY = playerY - overHeight;
    } else {
      // below the block, add
      playerY = playerY + overHeight;
    }
  }
}