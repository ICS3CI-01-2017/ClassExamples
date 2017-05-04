// button variables
float buttonX, buttonY, buttonW, buttonH;
boolean buttonOn;

void setup() {
  size(800, 600);
  // set button variables
  buttonOn = false; // button is off

  // button coordinates
  buttonW = 100;
  buttonH = 50;
  buttonX = width/2 - buttonW/2;
  buttonY = height/2;
}

void draw() {
  background(0);

  // if button is on
  if (buttonOn) {
    // fill green
    fill(0, 255, 0);
    // draw background rectangle
    rect(buttonX, buttonY, buttonW, buttonH);
    // draw the little slider
    fill(255, 255, 255);
    rect(buttonX + buttonW/2, buttonY, buttonW/2, buttonH);
  } else {
    // if the button is off
    // fill red
    fill(255, 0, 0);
    // draw background rectangle
    rect(buttonX, buttonY, buttonW, buttonH);
    // draw the little slider
    fill(255, 255, 255);
    rect(buttonX, buttonY, buttonW/2, buttonH);
  }
}

// the mouse has clicked somewhere
void mouseClicked() {
  // is the mouse inside the button
  if ( mouseX > buttonX 
    && mouseX < buttonX + buttonW 
    && mouseY > buttonY 
    && mouseY < buttonY + buttonH) {

    // flip the switch
    if (buttonOn) {
      buttonOn = false;
    } else {
      buttonOn = true;
    }
  }
}