// extra ball power up 
class ballPowerUp extends Powerup {
  int randomNumbers = 7;
  ballPowerUp(float x, float y, float l) {
    xPos = x;
    yPos = y;
    theLength = l;
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