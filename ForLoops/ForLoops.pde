
void setup(){
  size(800,600);
}


void draw(){
  // white background
  background(255);
  
  // start a variable called count at 0,
  // it counts up by 1 each time it loops,
  // stops when count = 10
  
  // for(initialize variable; condition; counting)
  for(int count = 0; count < 10; count++){
    // fill black
    fill(0,0,0);
    // draw circles
    // first circle at (100,50)
    // move the x over 50 each time
    ellipse(100 + count*50,50,50,50);
  }
  
  // checkboard
  boolean black = true;
  for(int row = 0; row < 8; row++){
    // for each row, draw 8 boxes
    // same as above
    for(int col = 0; col < 8; col++){
      // if black is true, 
      // change piece colour to black,
      // flip variable for next time
      if(black){
        fill(0,0,0);
        black = false;
      }else{
        fill(255,0,0);
        black = true;
      }
      
      // move x 50 for each column change
      // move y 50 for each row change
      ellipse(100 + col*50, 150 + row*50, 50, 50);
    }
    
    // flip the colour for the next row
    if(black){
      black = false;
    }else{
      black = true;
    }
    
  }
    
}