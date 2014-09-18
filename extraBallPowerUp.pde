// extra ball power up 
class ballPowerUp implements Powerup {
  boolean timeChecker = false; 
  float xPos = 0;
  float yPos = 0; 
  float theLength = 0;
  float velocity = 2;
  float timePassed = 0;
  int randomNumbers = 7;
  boolean runOnce = false;
  ballPowerUp(float x, float y, float l) {
    xPos = x;
    yPos = y;
    theLength = l;
  }
  void time() {
    if (runOnce == false && score%randomNumbers == 0 && timeChecker == false && score != 0) {
      randomNumbers = int(random(12) + 5); 
      timeChecker = true;
      shouldISetX = true;
      timePassed = millis();
      runOnce = true; 
    }
    else {
      shouldISetX = false;
    }
  }
  void setX() {
    if (shouldISetX == true) {
      xPos = random(width - theLength - width*.1) + 1 + width*.1;
      shouldISetX = false;
    }
  }
  void setY() {
    if (timeChecker == true) {
      yPos = yPos + velocity;
    }
  }
  void run() {
    if (timeChecker == true) {
      fill(255, 0, 255);
      rect(xPos, yPos, 20, theLength, 7);
    }
  }
  void gameOver() {
    timeChecker = false;
    lengthOfBar = 20;
  }
  boolean accept() {
    if (timeChecker == true && mouseX-lengthOfBar <= xPos  && mouseX + lengthOfBar >= xPos - 10 && yPos <= 450 + 5 && yPos >= 450 - 5) {
      timeChecker = false;
      yPos = 0;
      xPos = 0;
      //  println("You got the bar");
       errorList.add("if (timeChecker == true && mouseX-lengthOfBar <= xPos  && mouseX + lengthOfBar >= xPos - 10 && yPos <= 450 + 5 && yPos >= 450 - 5) {" + char(10) + "timeChecker = false;" + char(10) + "yPos = 0;" + char(10) + "xPos = 0;" + char(10) + "}"); 
       labelList(); 
      return true; 
    }
    else if ((millis() - timePassed) > 7000) {
      runOnce = false; 
      return false;
    }
    else if (timeChecker == true && yPos > height) {
      yPos = 0;
      xPos = 0;
      timeChecker = false;
      return false; 
    }
    else {
     return false; 
    }
  }
}
