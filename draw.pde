//draw loop 
void draw()
{ 
  if (start == true) { //if at start of game, run this loop 
    //array list of names 
    names = new ArrayList(); 
    if (keyPressed == true && key == CODED) {
      if (keyCode == ENTER) {
        names.add(name); 
        numberOfNames = numberOfNames + 1;
      }
    }
    //draw instructions
    background(0);
    image(startImg, 0, 0);
    fill(255, 0, 0);
    rect(210, 400, 80, 50);
    fill(0);
    textAlign(CENTER);
    text("Play", 250, 425);
  }
  else { //if not at start of game, run this loop
    //playing background 
    background(0);
    image(img, 0, 0);
    fill(255, 0, 0);
    noStroke(); 
    //draw bar 
    rect(mouseX - lengthOfBar, 450, 2*lengthOfBar, 20);  

    //run main ball functions
    ball1.setAcceleration(theLevel);
    ball1.update(); 
    //run large bar power-up functions
    largebar.time();
    largebar.setX();
    largebar.run();
    largebar.accept();
    largebar.setY();
    //run multi-ball power up functions
    ballMulti.time();
    ballMulti.setX();
    ballMulti.run();
    ballMulti.accept();
    ballMulti.setY();
    //run gun functions
    theGun.shoot();
    theGun.make();
    theGun.yPosi();
    theGun.shouldIKeepDrawing(); 
    //display score
    scoreDisplay(); 
    //run bricks 
    for (int j = 0; j < bricks.size(); j++) 
    {
      rowBrick bb = (rowBrick) bricks.get(j); //recall a element in the array of bricks
      bb.display(); //display brick
    }
    //add another ball
    if (ballMulti.accept() == true) { 
      otherBall b = (otherBall) multiBalls.get(numberOfBalls);
      b.run(1);
      if (numberOfBalls < 9) {
        numberOfBalls = numberOfBalls + 1;
      }
    }
    //draw extra balls
    for (int i = 0; i < multiBalls.size(); i++)
    {
      otherBall b = (otherBall) multiBalls.get(i);
      b.setAcceleration(theLevel);
      b.update(); 
      //check for intersection between extra balls and bricks 
      for (int j = 0; j < bricks.size(); j++)
      {
        rowBrick bb = (rowBrick) bricks.get(j);
        println("Other ball coords" + b.getX() + " " + b.getY());
        if (bb.intersect(b.getX(), b.getY()))
        {
          time = millis(); 
          soundRun = true; 
          b.bounceBack();
          bricks.remove(bb);
        }
        if (soundRun == true) { //sound code 
          if (shouldMuteMusic == false) {
            if (millis() - time <= 100) {
              song1.unmute();
            } 
            else {
              song1.mute();
              soundRun = false;
            }
          }
        }
      }
    }
    //check for intersection between bricks and main ball
    for (int j = 0; j < bricks.size(); j++)
    {
      rowBrick bb = (rowBrick) bricks.get(j);
      if (bb.intersect(ball1.getX(), ball1.getY()))
      { 
        time = millis(); 
        soundRun = true; 
        ball1.bounceBack();
        bricks.remove(bb);
        errorList.add("ball1.bouncBack();");
        errorList.add("bricks.remove(bb);");  
        labelList();
      }
      if (soundRun == true) { //sound code
        if (shouldMuteMusic == false) {
          if (millis() - time <= 100) {
            song1.unmute();
          } 
          else {
            song1.mute();
            soundRun = false;
          }
        }
      }
    }
    if (bricks.size() == 0) { //go to the next level 
      theLevel = theLevel + 1; 
      errorList.add("levels.nextLevel(theLevel);"); 
      labelList();      
      levels.nextLevel(theLevel);
      song1.mute();
    }
  }
  float checkForCheaters = score%7*10+score%6; //verification score
  //label6.setText("" + checkForCheaters); //display verification score
}