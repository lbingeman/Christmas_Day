//code for object redBall, the main play ball
abstract class Ball { //interface for balls
  protected float size = 0;
  protected float xPos = 0;
  protected float yPos = 0;
  protected float velocityY = 0;
  protected float velocityYInital = 0; 
  protected float velocityX = 1;
  protected float acceleration = .01; 
  protected boolean checker = true;
  protected boolean doIDraw = false; 
  protected color ball_color = color(255,255,0);
  abstract void update();
  void bounceBack(){
    velocityY = -velocityY;
    score = score + 10;
  }
  void restart(){}
  void xPosi(){
    if (doIDraw == true) {
      xPos = xPos + velocityX;
    }
  }
  void yPosi(){
    if (doIDraw == true) {
      velocityY = velocityY + acceleration;
      yPos = yPos + velocityY;
    }
  }
  abstract boolean acceleration();
  float getX() { //get the x position
    return xPos;
  } 
  float getY() { //get the y position
    return yPos;
  } 
  void levelUp(){}
  void setAcceleration(float level){
    float n = .01+.001*(level); 
    if (level < 2) {
      n = .01;
    }
    acceleration = (acceleration/abs(acceleration))*n; //function to set acceleration
  }
  void run(int number){}
}

class RedBall extends Ball { 
  float frameRateNumber = 100;
  float currentNumber = 0; 
  //constructor
  RedBall(float x, float y, float s)
  {
    doIDraw = true;
    xPos = x;
    yPos = y;
    size = s;
  }
  void restart() { //reset ball to original state
    xPos = random(width - 50); //randomize where ball starts
    yPos = 0;
    velocityY = 0;
    velocityYInital = 0;
    acceleration = .01;
    velocityX = 0.5;
  }
  void update() //update the drawing
  {
    if (doIDraw == true) { //if I should draw run this loop 
      noStroke(); 
      fill(ball_color);
      ellipse(xPos, yPos, size, size);
    }
    xPosi();
    yPosi();
    acceleration();
  }
  void yPosi() //change y psotion 
  {
    velocityY = velocityY + acceleration; //change velocity
    yPos = yPos + velocityY; //chance y-position 
    if (currentNumber == frameRateNumber) { //code for printing out code. Uses current number to ensure that code isn't printed out too quickly
      errorList.add("velocityY = velocityY + acceleration;"); 
      labelList(); 
      currentNumber = 0;
    }
    else if (currentNumber < frameRateNumber) {
      currentNumber = currentNumber + 1;
    }
  }
  boolean acceleration() { 
    if (yPos <= 0 && checker == true) { //if the ball is off the top of the screen, change velocity sign so ball goes back on the screen 
      checker = false;
      velocityY = -velocityY + velocityY*0.01;
    }
    if (mouseX - lengthOfBar<= xPos  && mouseX + lengthOfBar >= xPos - 10 && yPos <= 450 + 5 && yPos >= 450 - 5) { // if hits the bar, bounce off the bar
      velocityY = -acceleration*300;
      velocityX = map(xPos, (mouseX-lengthOfBar), (mouseX+lengthOfBar), -1, 1);
      score = score + 1;
      errorList.add("velocityX = map(xPos, (mouseX-lengthOfBar), (mouseX+lengthOfBar), -1, 1);"); 
      labelList();    
    }
    else if (yPos >= 500) { //if player drops the ball, game over
      gameOver = true;
      gameOverButton();
      errorList.add("gameOverButton();"); 
      labelList();
      noLoop();
    }
    if (yPos < height && yPos > 0) { //ball in play
      checker = true;
    }
    if (xPos >= width || xPos <= 0) { //bounce off side of the screen so ball is always visiable 
      velocityX = -velocityX;
    }
    return true;
  } 
  //void mouseClick() { //useless function (used in earlier versions). Not called
  //  if (mousePressed == true) {
  //    xPos = mouseX;
  //    yPos = mouseY;
  //    velocityY = 0;
  //  }
  //} 
  //void grow(int amount) //useless function (used in earlier versions). Not called
  //{
  //  size += (1+amount);
  //}
}