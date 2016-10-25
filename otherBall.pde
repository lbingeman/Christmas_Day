//code for running the extra balls 
class otherBall extends Ball {
  //constructor
  otherBall(float x, float y, float s)
  {
    xPos = x;
    yPos = y;
    size = s;
  }
  void run(int number) {
    if (number == 1) {
      doIDraw = true;
      restart();
    }
    if (number == 0) {
      doIDraw = false; 
      restart();
    }
  }
  void restart() {
    xPos = 0;
    yPos = 0;
    velocityY = 0;
    velocityYInital = 0;
    acceleration = .01;
    velocityX = 1;
  }

  void levelUp() {
    if (score%10 == 0) {
      acceleration *= 1.1;
    }
  }
  void update()
  {
    if (doIDraw == true) {
      noStroke(); 
      fill(255, 0, 0);
      ellipse(xPos, yPos, size, size);
    }
    xPosi();
    yPosi();
    acceleration();
  }
  //void xPosi() 
  //{ 
  //  if (doIDraw == true) {
  //    xPos = xPos + velocityX;
  //  }
  //}
  //void yPosi() 
  //{
  //  if (doIDraw == true) {
  //    velocityY = velocityY + acceleration;
  //    yPos = yPos + velocityY;
  //  }
  //} 
  boolean acceleration() {
    if (yPos <= 0 && checker == true) {
      checker = false;
      velocityY = -velocityY + velocityY*.1;
    }

    if (mouseX - lengthOfBar<= xPos  && mouseX + lengthOfBar >= xPos - 10 && yPos <= 450 + 5 && yPos >= 450 - 5) {
      velocityY = -acceleration*300;
      velocityX = map(xPos, (mouseX-lengthOfBar), (mouseX+lengthOfBar), -1.0, 1.0);
      errorList.add("velocityX = map(xPos, (mouseX-lengthOfBar), (mouseX+lengthOfBar), -1.0, 1.0);"); 
      errorList.add("velocityY = -3;"); 
      labelList();   
      score = score + 2;    
    }
    if (yPos >= 500) {
      doIDraw = false;
      if (doIDraw == true) {
        numberOfBalls = numberOfBalls - 1;
      }
      restart(); 
    }
    if (yPos < height && yPos > 0) {
      checker = true;
    }
    if (xPos >= width || xPos <= 0) {
      velocityX = -velocityX;
    }
    return true;
  } 
  //void mouseClick() {
  //  if (mousePressed == true) {
  //    xPos = mouseX;
  //    yPos = mouseY;
  //    velocityY = 0;
  //  }
  //} 
  //void grow(int amount)
  //{
  //  size += (1+amount);
  //}
}