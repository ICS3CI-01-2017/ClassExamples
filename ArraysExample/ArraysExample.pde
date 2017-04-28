//define 2 arrays of floating point numbers
float[] x;
float[] y;

// array to hold mouse coordinates
float[] mX; // mouse x coordinates
float[] mY; // mouse y coordinates

void setup(){
  size(800,600);
  
  // create the list of size 10
  x = new float[10];
  y = new float[10];
  
  // put things into the array, 
  // spot 0 is the first position
  x[0] = 10;
  y[0] = 50;
  // spot 1 is the second position
  x[1] = 100;
  y[1] = 400;
  
  
  // create the list of mouse coordinates
  // use 256 to keep the colour value :)
  // 0 - 255 is 256 spaces...
  mX = new float[256];
  mY = new float[256];
  
  // fill arrays with negative numbers
  // go through every position in the array
  for(int i = 0; i < 256; i++){
    // sets the position off the screen
    mX[i] = -100;
    mY[i] = -100;
  }
}

void draw(){
  background(0);
  fill(255,255,255);
  
  // use the x and y coordinates to draw
  rect(x[0], y[0], 50, 50);
  rect(x[1], y[1], 100, 50);
  
  // shuffle all points down
  // stop 1 position short on the end
  // 255 instead of 256
  for(int i = 0; i < 255; i++){
    // Example: mX[0] = mX[1]
    mX[i] = mX[i+1];
    mY[i] = mY[i+1];
  }
  // set the head of the snake
  mX[255] = mouseX;
  mY[255] = mouseY;
  
  // draw!
  for(int i = 0; i < 256; i++){
    // set the fill from black to white
    fill(i);
    // draw circles at each spot
    noStroke();
    ellipse(mX[i], mY[i], 20,20);
  }
  
}