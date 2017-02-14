// creating 2 variables for the ball position
float ballX; // ball's x position
float ballY; // ball's y position
float direction; // ball's direction
float directionY;
float speed;

void setup(){
  size(800,600);
  ellipseMode(CENTER);
  
  // set the variables to a value
  ballX = width/2;
  ballY = height/2;
  direction = +2;
  directionY = +2;
  speed = 5;
}

void draw(){
  //// keyboard control
  //if(keyPressed){
  //  if(keyCode == UP){
  //    speed = speed + 1;
  //  }else if(keyCode == DOWN){
  //    speed = speed - 1;
  //  }
  //}
  
  // move the ball's x position
  ballX = ballX + direction*speed;
  // move the ball's y position
  ballY = ballY + directionY*speed;
  
  // see if the ball hit the right side
  if(ballX + 25 >= width){
      // start subtracting instead
      direction = -1;
      speed = 2;
  }
  // see if the ball hit the left side
  if( ballX - 25 <= 0){
      // change the direction
      direction = +1;
      speed = 10;
  }
  
  if(ballY + 25 >= height){
      // start subtracting instead
      directionY = -1;
  }
  // see if the ball hit the top side
  if( ballY - 25 <= 0){
      // change the direction
      directionY = +1;
  }
  
  
  // set a background & erase screen
  background(0,0,0);
  // change the colour to red
  fill(255,0,0);
  // draw ellipse in the center of the screen
  ellipse(ballX, ballY, 50, 50);
}