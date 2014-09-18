void gameOverButton() {
  textfield1.setText(textfield1.getDefaultText());
  numberOfPlays = numberOfPlays + 1; 
  highScoreNameEnter = false; 
  song1.mute(); 
  start = true; 
  fill(255, 0, 0);
  rect(width/2-50, height/2-50, 100, 100);
  fill(0);
  textAlign(CENTER);
  text("Play Again", width/2, height/2);
  text("Score: " + score, width/2, height/2 + 20);
  errorList.add("text(Score: + score, width/2, height/2 + 20);"); 
  labelList();
}
void keyPressed() {
  if ((key == 'p' || key == 'P')&& pause == false) {
    pause = true;
    fill(16, 98, 26);
    rect(width/2-50, height/2-50, 100, 100);
    fill(0);
    textAlign(CENTER);
    text("Paused", width/2, height/2);
    noLoop();
  } 
  else if ((key == 'p' || key == 'P')&& pause == true) {
    pause = false; 
    loop();
  }
  else if (shouldMuteMusic == false && keyPressed && (key == 'm' || key == 'M')) {
    song.mute(); 
    shouldMuteMusic = true;
  }
  else if (shouldMuteMusic == true && keyPressed && key == 'm' || key == 'M') {
    song.unmute(); 
    shouldMuteMusic = false; 
  }
}
void mousePressed() {
  if (start == true && mouseX >= 210 && mouseX <= 290 && mouseY >= 400 && mouseY <=450) {
    start = false;
  }
  if (gameOver == true && mouseX >= width/2-25 && mouseX <= width/2-25+50 && mouseY >= height/2-25 && mouseY <= height/2+50 && mousePressed == true) {
    loop();
    float theSize = bricks.size();
    for (int i = 0; i < theSize; i++) {
      bricks.remove(0);
    }
    gameOver = false;
    ball1.restart(); 
    for (int i = 0; i < multiBalls.size(); i++)
    {
      otherBall b = (otherBall) multiBalls.get(i);
      b.run(0);
    }
    numberOfBalls = 0; 
    score = 0;
    theLevel = 1; 
    for (int i = 0; i < 7; i++)
    {
      rowBrick b = new rowBrick((50*i) + 75, 90);
      bricks.add(b);
    }
  }
  if (bricks.size() == 0 && mouseX >= width/2-25 && mouseX <= width/2-25+50 && mouseY >= height/2-25 && mouseY <= height/2+50 && mousePressed == true) {
    loop(); 
    for (int i = 0; i < multiBalls.size(); i++)
    {
      otherBall b = (otherBall) multiBalls.get(i);
      b.run(0);
    } 
    numberOfBalls = 0; 
    if (theLevel < 10) {
      for (int k = 0;k < theLevel; k++) {
        for (int i = 0; i < 7; i++) {
          rowBrick b = new rowBrick((50*i) + 75, 90+(32*k));
          bricks.add(b);
          if (theLevel == 2) {
            if (k == 0) {
              if (i == 1 || i==3 || i==5) {
                bricks.remove(b);
              }
            }
            if (k == 1) {
              if (i == 0 || i==2 || i==4 || i==6) {
                bricks.remove(b);
              }
            }
          }
        }
      }
    }
    else {
      for (int k = 0;k < 10; k++) {
        for (int i = 0; i < 7; i++) {
          rowBrick b = new rowBrick((50*i) + 75, 90+(32*k));
          bricks.add(b);
          if (theLevel == 2) {
            if (k == 0) {
              if (i == 1 || i==3 || i==5) {
                bricks.remove(b);
              }
            }
            if (k == 1) {
              if (i == 0 || i==2 || i==4 || i==6) {
                bricks.remove(b);
              }
            }
          }
        }
      }
    }
    ball1.restart();
  }
}

