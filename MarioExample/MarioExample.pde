// player variables
float x, y, w, h;

// gravity & jumping
float gravity, dy;

// block variables
float[] blockX, blockY, blockW, blockH;
int numBlocks;

// control variables
boolean right, left, jump, isJumping, doubleJump;

// camera coordinates
float camX, camY;

void setup(){
  size(800,600);
  // set the player variables
  x = 100;
  y = 400;
  w = 50;
  h = 100;
  dy = 0;
  
  // camera at 0
  camX = 0;
  camY = 0;
  
  // gravity force
  gravity = 1;
  
  // controls
  right = false;
  left = false;
  jump = false;
  isJumping = false; // on ground or not
  doubleJump = false; // keeping track if double jump is used
  
  // blocks
  numBlocks = 6;
  blockX = new float[numBlocks];
  blockY = new float[numBlocks];
  blockW = new float[numBlocks];
  blockH = new float[numBlocks];
  
  // setting block positions
  blockX[0] = 0;
  blockY[0] = 500;
  blockW[0] = 650;
  blockH[0] = 100;
  
  blockX[1] = 350;
  blockY[1] = 250;
  blockW[1] = 50;
  blockH[1] = 50;
  
  blockX[2] = 400;
  blockY[2] = 250;
  blockW[2] = 50;
  blockH[2] = 50;
  
  blockX[3] = 450;
  blockY[3] = 250;
  blockW[3] = 50;
  blockH[3] = 50;
  
  blockX[4] = 525;
  blockY[4] = 450;
  blockW[4] = 50;
  blockH[4] = 50;
  
  blockX[5] = 775;
  blockY[5] = 500;
  blockW[5] = 650;
  blockH[5] = 100;
}

void draw(){
  // white background
  background(255); 
  
  // draw the blocks
  for(int i = 0; i < numBlocks; i++){
     fill(0); // fill black
     rect(blockX[i] - camX, blockY[i] - camY, blockW[i], blockH[i]);
  }
  
  // draw player
  fill(255,0,0); // fill red
  rect(x - camX,y - camY,w,h);
  
  // player movement
  if(left){
    x = x - 3;
  }else if(right){
    x = x + 3;
  }
  
  // jumping - pressing jump key and 
  //           not in air
  if(jump && !isJumping){
    isJumping = true; // now in air
    dy = -20; // lots of upward force
  }
  
  // jump is pressed, in air, haven't double jumped, and falling
  if(jump && isJumping 
          && !doubleJump && dy >= 0){
    dy = -20;
    doubleJump = true;
  }
  // apply gravity to the force
  dy = dy + gravity;
  
  // apply the force to player
  y = y + dy;
  
  
  // move camera after character passes half screen
  if(x > width/2){
    camX = x - width/2;
  }
  
  // check to see if i should be falling
  // assuming not hitting something
  boolean colliding = false;
  // go through all blocks looking for collisions
  for(int i = 0; i < numBlocks; i++){
    // is player hitting a block?
    if(collides(x, y, w, h, 
                blockX[i], blockY[i], 
                blockW[i], blockH[i])){
       // tell variable i am hitting something
       colliding = true;
       // fix the collision
       fixCollision(blockX[i], blockY[i], 
                    blockW[i], blockH[i]);
    }
  }
  
  // avoid "air jumping"
  if(!colliding){
    isJumping = true;
  }
  
}

void keyPressed(){
  // left and right -> a and d
  // jump - > spacebar
  if(key == 'a'){
    left = true;
  }else if(key == 'd'){
    right = true;
  }else if(key == ' '){
    jump = true;
  }
}

void keyReleased(){
  // left and right -> a and d
  // jump - > spacebar
  if(key == 'a'){
    left = false;
  }else if(key == 'd'){
    right = false;
  }else if(key == ' '){
    jump = false;
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
  float overWidth = min(x + w - x1, x1 + w1 - x);
  float overHeight = min(y + h - y1, y1 + h1 - y);

  // fix the collision on the X axis
  if (overWidth < overHeight) {
    // determine which side we are on
    if (x < x1) {
      // on the left, subtract to fix
      x = x - overWidth;
    } else {
      // on the right, add to fix
      x = x + overWidth;
    }
  } else {
    // stop gravity pulling me down
    dy = 0;
    
    // fixing the Y axis
    // are we above or below the block
    if (y < y1) {
      // above the block, subtract
      // standing on block!
      isJumping = false;
      doubleJump = false;
      y = y - overHeight;
    } else {
      // below the block, add
      y = y + overHeight;
    }
  }
}