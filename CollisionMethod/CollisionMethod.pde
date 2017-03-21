// player variables
float playerX, playerY, playerW, playerH;

// block variables
float blockX, blockY, blockW, blockH;
// block variables
float blockX2, blockY2, blockW2, blockH2;

// control variables
boolean right, left, up, down;


void setup() {
  size(800, 600);

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

  // control values
  right = false;
  left = false;
  down = false;
  up = false;
}


void draw() {
  // black background
  background(0);

  // draw block
  // blue fill
  fill(0, 0, 255);
  rect(blockX, blockY, blockW, blockH);
  rect(blockX2, blockY2, blockW2, blockH2);

  // draw the player
  // red fill
  fill(255, 0, 0);
  rect(playerX, playerY, playerW, playerH);

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