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
  // set the starting position of snake
  snakeX[0] = width/2;
  snakeY[0] = height/2;
  
  // size objects
  size = 25;
  
  // speed of snake
  snakeSpeed = 0.5; // seconds of delay
  
  // with 800x600 - 
  //     31 spots across
  //     23 spots down
  // random apple position
  appleX = random(0,31)*25;
  appleY = random(0,23)*25;
  
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
      // if hit apple
          // grow snake
          // move apple
  // check if hit walls/self
  
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