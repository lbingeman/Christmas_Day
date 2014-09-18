//code for running the extra balls 
class otherBall implements Ball {
  float size = 0;
  float xPos = 0;
  float yPos = 250;
  float velocityY = 0;
  float velocityYInital = 0; 
  float velocityX = 1;
  float acceleration = .01; 
  boolean checker = true;
  boolean doIDraw = false; 
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
  void setAcceleration(float n) {
    acceleration = (acceleration/abs(acceleration))*n;
  }
  void bounceBack() {
    velocityY = -velocityY;
    score = score + 10;
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
  float getX() {
    return xPos;
  } 
  float getY() {
    return yPos;
  } 
  void update()
  {
    if (doIDraw == true) {
      noStroke(); 
      fill(255, 0, 0);
      ellipse(xPos, yPos, size, size);
    }
  }
  void xPosi() 
  { 
    if (doIDraw == true) {
      xPos = xPos + velocityX;
    }
  }
  void yPosi() 
  {
    if (doIDraw == true) {
      velocityY = velocityY + acceleration;
      yPos = yPos + velocityY;
    }
  } 
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
  void mouseClick() {
    if (mousePressed == true) {
      xPos = mouseX;
      yPos = mouseY;
      velocityY = 0;
    }
  } 
  void grow(int amount)
  {
    size += (1+amount);
  }
}

