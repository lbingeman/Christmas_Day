//code for using the gun 
class gun implements boom {
  float xPos;
  float yPos = 450; 
  float velocityY = 1; 
  boolean shouldIrun = false;
  gun() {
  }
  void shoot() {
    if ((keyPressed) && ((key == 's') || (key == 'S')) && shouldIrun == false) {
      errorList.add("if ((keyPressed) && ((key == 's') || (key == 'S')) && shouldIrun == false) {" + char(10) + "shouldIrun = true;" + char(10) +  "xPos = mouseX;" + char(10) + "yPos = 450;" + char(10) + "}"); 
      labelList(); 
      //println("shoot");  
      shouldIrun = true;
      xPos = mouseX;
      yPos = 450;
    }
  }
  void make() {
    if (shouldIrun == true) {
      //println("I've drawn"); 
      fill(98, 88, 88); 
      ellipse(xPos, yPos, 10, 10);
      println(yPos);
    }
  }
  void yPosi() {
    yPos = yPos - velocityY;
  }
  void shouldIKeepDrawing() {
    if (shouldIrun == true) {
      for (int i = 0; i < bricks.size(); i++)
      {
        rowBrick b = (rowBrick) bricks.get(i);
        if (b.intersect(xPos, yPos))
        {
          errorList.add("if (b.intersect(xPos, yPos)){" + char(10) + "bricks.remove(b);" + char(10) + "}"); 
          labelList(); 
          bricks.remove(b);
          time = millis(); 
          soundRun = true; 
          score = score - 7; 
          shouldIrun = false;
          // yPos = 450;
        }
        else if (yPos <= 0) {
          //println("STOP"); 
          shouldIrun = false;
          //yPos = 450;
        } 
        if (soundRun == true) {
          if (shouldMuteMusic == false) {
            if (millis() - time <= 100) {
              song1.unmute();
            } 
            else { 
              errorList.add("if(millis() - time > 100) { " + char(10) + "song1.mute()" + char(10) + "soundRun = false;" + char(10) + "}"); 
              labelList(); 
              song1.mute();
              soundRun = false;
            }
          }
        }
      }
    }
  }
}

