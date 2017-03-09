// player position
float x;
float y;
// player direction
float dx;
float dy;
// player speed
float speed;

float gravity;

// keys
boolean right;
boolean left;
boolean jump;
boolean isJumping;

void setup(){
  size(800,600);
  
  // sets initial player positions
  x = 100;
  y = 100;
  // sets player movement to none
  dx = 0;
  dy = 0;
  // sets how fast the player moves and gravity value
  // bigger gravity = fall faster
  speed = 3;
  gravity = 2;
  
  // used to link keys to actions
  // when these are true -> player does action
  right = false;
  left = false;
  jump = false;
  
  // is the player currently in the air?
  isJumping = false;
}

void draw(){
  // black background
  background(0);
  
  // left/right movement control
  if(right){
    dx = 1;
  }else if(left){
    dx = -1;
  }else{
    dx = 0;
  }
  // move the player
  x = x + dx*speed;
  
  // gravity changing y movement
  dy = dy + gravity;
  // move y
  y = y + dy;
  
  // check if player is touching the bottom
  // standing on floor
  if(y + 50 > height){
    y = height - 50; // put me on the floor
    dy = 0; // no y change anymore
    isJumping = false; // no longer jumping
  }
  
  // if pressing jump and not already jumping
  if(jump && !isJumping){
    isJumping = true; // I'm jumping!
    dy = -30;
  }
  
  // draw the player
  fill(255);
  rect(x,y,50,50); // player
  
}

// this method runs any time a key is pressed
// we use it to set variables that we use in draw
void keyPressed(){
  // tell the computer which keys we are pressing
  // we named the variables after the actions
  if(key == 'd'){ // move right if d is pressed
    right = true;
  }else if(key == 'a'){ // move left if a is pressed
    left = true;
  }else if(key == ' '){ // jump if space is pressed
    jump = true;
  }
}

// this method runs when a key is released
// we use it to unset variables used in draw
void keyReleased(){
  if(key == 'd'){ // not pressing right anymore
    right = false;
  }else if(key == 'a'){ // not pressing left anymore
    left = false;
  }else if(key == ' '){ // not pressing jump anymore
    jump = false;
  }
}