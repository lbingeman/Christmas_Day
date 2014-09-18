//display button for going to the next level
class levelBricks implements bricksLevel {
  levelBricks() {
  }
  void nextLevel(float level) {
    fill(16, 98, 26);
    rect(width/2-50, height/2-50, 100, 100);
    fill(0);
    textAlign(CENTER);
    text("Go to Level " + level, width/2, height/2);
    noLoop();
  }
}



  

