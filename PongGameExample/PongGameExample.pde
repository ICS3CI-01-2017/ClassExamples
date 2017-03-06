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

// score variables
int p1Score;
int p2Score;

void setup(){
  size(800,600);
  ellipseMode(CENTER);
  
  // place ball
  ballX = width/2;
  ballY = height/2;
  ballSpeed = 2;
  ballSize = 25;
  
  // setting initial ball movement
  int ballXDirection = (int)random(0,10);
  int ballYDirection = (int)random(0,10);
  // random x movement
  if(ballXDirection < 5 ){
    ballDX = 1;
  }else{
    ballDX = -1;
  }
  // random y direction
  if(ballYDirection < 5){
    ballDY = 1;
  }else{
    ballDY = -1;
  }
  
  
  
  // paddle variables
  paddleWidth = 25;
  paddleHeight = 100;
  paddleSpeed = 5;
  paddle1X = 50;
  paddle1Y = height/2 - paddleHeight/2;
  
  paddle2X = width - 50 - paddleWidth;
  paddle2Y = height/2 - paddleHeight/2;
  
  // set paddle movement to 0 - no movement
  paddle1DY = 0;
  paddle2DY = 0;
  
  // initial scores to 0
  p1Score = 0;
  p2Score = 0;
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
    // give player 1 points
    p1Score = p1Score + 1;
  }
  
  // ball hits lefthand side
  if(ballX - ballSize/2 < 0){
    // reset the position
    ballX = width/2;
    ballY = height/2;
    // give player 2 points
    p2Score = p2Score + 1;
  }
  
  // stop paddle movement
  paddle1DY = 0;
  paddle2DY = 0;
  
  // see if a key is pressed
  if(keyPressed){
    
    // if w is pressed
    if(key == 'w'){
      // move the paddle1 up
      paddle1DY = -1;
    // is the s key pressed
    }else if(key == 's'){
      // move paddle1 down
      paddle1DY = 1;
    // if no key for player 1 is pressed
    }
    
    if(keyCode == UP){
      paddle2DY = -1;
    }else if(keyCode == DOWN){
      paddle2DY = 1;
    }
    
  }
  
  // move paddle 1
  paddle1Y = paddle1Y + paddle1DY*paddleSpeed;
  // move paddle 2
  paddle2Y = paddle2Y + paddle2DY*paddleSpeed;
  
  // does the ball hit the paddle2
  if(!(ballX + ballSize/2 < paddle2X || 
       ballY + ballSize/2 < paddle2Y ||
       ballY - ballSize/2 > paddle2Y + paddleHeight)){
    // make ball move to the left
    ballDX = -1;
  }
  
  // does the ball hit the paddle1
  if(!(ballX - ballSize/2 > paddle1X + paddleWidth || 
       ballY + ballSize/2 < paddle1Y ||
       ballY - ballSize/2 > paddle1Y + paddleHeight)){
    // make ball move to the right
    ballDX = 1;
  
  }
  
  // draw the score
  textSize(40);
  text(p1Score, width/2 - 100, 50);
  text(p2Score, width/2 + 100, 50);
  
}