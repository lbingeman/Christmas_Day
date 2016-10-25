//power-up for long bar
abstract class Powerup{
  float xPos = 0;
  float yPos = 0; 
  float theLength = 0;
  float velocity = 2;
  float timePassed = 0;
  int randomNumbers = 5;
  boolean runOnce = false;
  boolean timeChecker = false; 
  void time(){
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
  void run(){}
  void setX(){
    if (shouldISetX == true) {
      xPos = random(width - theLength - width*.1) + 1 + width*.1;
      shouldISetX = false;
    }
  }
  void setY(){
    if (timeChecker == true) {
      yPos = yPos + velocity;
    }
  }
  void gameOver(){}
  abstract boolean accept();
}

class largeBar extends Powerup {
  largeBar(float x, float y, float l) {
    xPos = x;
    yPos = y;
    theLength = l;
  }

  void run() {
    if (timeChecker == true) {
      fill(0, 255, 0);
      rect(xPos, yPos, 20, theLength, 7);
    }
  }
  void gameOver() {
    timeChecker = false;
    lengthOfBar = 20;
  }
  boolean accept() {
    if (timeChecker == true && mouseX-lengthOfBar <= xPos  && mouseX + lengthOfBar >= xPos - 10 && yPos <= 450 + 5 && yPos >= 450 - 5) {
      lengthOfBar = 50;
      timeChecker = false;
      yPos = 0;
      xPos = 0;
      errorList.add("lengthOfBar = 50;"); 
       labelList(); 
      //  println("You got the bar");
    }
    else if ( lengthOfBar == 50 && (millis() - timePassed) > 7000) {
      lengthOfBar = 20;
      errorList.add("if(lengthOfBar == 50 && (millis() - timePassed) > 7000){" + char(10) + "lengthOfBar = 20;" + char(10) + "}"); 
       labelList(); 
      runOnce = false; 
    }
    else if (timeChecker == true && yPos > height) {
      yPos = 0;
      xPos = 0;
      timeChecker = false;
    }
    return false;
  }
}