// position of the snake body
float[] snakeX;
float[] snakeY;
// snake speed
float snakeSpeed;


// apple coordinates
float appleX;
float appleY;

// direction
char direction;

// size of objects
float size;

// delay
float nextTime;
float lastTime;

// number of pieces
int numPieces;

void setup(){
  // 800x600 screen size
  size(800,600);

  // create room for 1000 snake pieces
  snakeX = new float[1000];
  snakeY = new float[1000];
  
  // set the number of pieces
  numPieces = 1;
  
  // fill array with negative numbers
  // so you don't see a flashing block
  for(int i = 0; i < 1000; i++){
    snakeX[i] = -100;
    snakeY[i] = -100;
  }
  // set the starting position of snake
  snakeX[0] = width/2;
  snakeY[0] = height/2;
  
  // size objects
  size = 25;
  
  // speed of snake
  snakeSpeed = 0.2; // seconds of delay
  
  // with 800x600 - 
  //     31 spots across
  //     23 spots down
  // random apple position
  appleX = (int)random(0,31)*25;
  appleY = (int)random(0,23)*25;
  
  // set starting direction
  direction = 's';
  
  // delay setup
  lastTime = 0;
  nextTime = 0; 
}

void draw(){
  // black background
  background(0);
 
  // draw snake and apple
  drawScreen();
  // change snake direction - automatically
  // move snake
  moveSnake();
  // check if hit an apple
  // is the head of the snake on the apple
  if(snakeX[0] == appleX && 
     snakeY[0] == appleY){
     // grow snake
     numPieces = numPieces + 1;
     // move apple
     appleX = (int)random(0,31)*25;
     appleY = (int)random(0,23)*25;
  }
      
  // check if hit walls/self
  // walls
  if(snakeX[0] < 0 || snakeX[0] >= width ||
     snakeY[0] < 0 || snakeY[0] >= height){
       // stop the game
       noLoop();
       // game over message
       textSize(40);
       text("Game Over!", width/2 - 125, height/2);
  }
  // snake hitting itself
  // look to see if the head is the same
  // as any other piece
  for(int i = 1; i < numPieces; i++){
    // is the head equal to another part  
    if(snakeX[0] == snakeX[i] &&
         snakeY[0] == snakeY[i]) {
       // game over man!
       // stop the game
       noLoop();
       // game over message
       textSize(40);
       text("Game Over!", width/2 - 125, height/2);
    }
  }
  
}

// method to draw all the objects 
// on the screen
void drawScreen(){
  // white colour
  fill(255,255,255);
  // draw snake pieces
  for(int i = 0; i < numPieces; i++){
    rect(snakeX[i], snakeY[i], size, size);
  }
  
  // red colour
  fill(255,0,0);
  // draw apple
  rect(appleX, appleY, size, size); 
}

// to changed direction if key is pressed
void keyPressed(){
  // see if up is pressed
  if(keyCode == UP){
    direction = 'u';
  // see if down is pressed
  }else if(keyCode == DOWN){
    direction = 'd';
  // see if right is pressed
  }else if(keyCode == RIGHT){
    direction = 'r';
  // see if left is pressed
  }else if(keyCode == LEFT){
   direction = 'l'; 
  }
}

void moveSnake(){
  // get current time in milliseconds
  float currentTime = millis(); 

  // check if timer is up to move
  if(currentTime > nextTime){
    
    // shuffle pieces down to make room
    // for the new position
    for(int i = numPieces - 1; i > 0; i--){
      snakeX[i] = snakeX[i-1];
      snakeY[i] = snakeY[i-1];
    }
    
    
    // check which direction to move
    if(direction == 'u'){
      // move snake up
      snakeY[0] = snakeY[0] - size;
      // set next time
      nextTime = currentTime + 1000*snakeSpeed;
    }else if(direction == 'd'){
      // move snake down
      snakeY[0] = snakeY[0] + size;
      // set next time
      nextTime = currentTime + 1000*snakeSpeed;
    }else if(direction == 'r'){
      // move snake right
      snakeX[0] = snakeX[0] + size;
      // set next time
      nextTime = currentTime + 1000*snakeSpeed;
    }else if(direction == 'l'){
      // move snake left
      snakeX[0] = snakeX[0] - size;
      // set next time
      nextTime = currentTime + 1000*snakeSpeed;
    }
  }
}