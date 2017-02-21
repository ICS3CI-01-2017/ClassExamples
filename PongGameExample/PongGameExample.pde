// variables for the ball
float ballX, ballY, ballSpeed, ballSize;
int ballDX;
int ballDY;

// paddle variables
float paddle1X;
float paddle1Y;
int paddle1DY;

float paddle2X;
float paddle2Y;
int paddle2DY;

float paddleSpeed;
float paddleWidth;
float paddleHeight;

void setup(){
  size(800,600);
  ellipseMode(CENTER);
  
  // place ball
  ballX = width/2;
  ballY = height/2;
  ballSpeed = 2;
  ballSize = 25;
  // move the ball downwards right
  ballDX = 1;
  ballDY = 1;
  
  // paddle variables
  paddleWidth = 25;
  paddleHeight = 100;
  paddleSpeed = 2;
  paddle1X = 50;
  paddle1Y = height/2 - paddleHeight/2;
  
  paddle2X = width - 50 - paddleWidth;
  paddle2Y = height/2 - paddleHeight/2;
}

void draw(){
  // black background, white objects
  background(0,0,0);
  fill(255,255,255);
  // draw the ball
  ellipse(ballX, ballY, ballSize, ballSize);
  // draw the paddles
  rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
  rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);
  
  // move the ball
  ballX = ballX + ballDX*ballSpeed;
  ballY = ballY + ballDY*ballSpeed;
  
  // bounce ball off bottom
  if(ballY + ballSize/2 > height){
    // change the y direction of the ball
    ballDY = -1;
  }
  
  // bounce ball off top
  if(ballY - ballSize/2 < 0){
    // change the direction of the ball
    ballDY = 1;
  }
  
  // ball hits righthand side
  if(ballX + ballSize/2 > width){
    // reset the position
    ballX = width/2;
    ballY = height/2;
  }
  
  // ball hits lefthand side
  if(ballX - ballSize/2 < 0){
    // reset the position
    ballX = width/2;
    ballY = height/2;
  }
  
  
  // see if a key is pressed
  if(keyPressed){
    // if w is pressed
    if(key == 'w'){
      paddle1DY = -1;
    // is the s key pressed
    }else if(key == 's'){
      paddle1DY = 1;
    // if no key for player 1 is pressed
    }else{
      // stop moving the paddle
      paddle1DY = 0;
    }
    
  }
  
}