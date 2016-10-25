//high score table
/*
Array of an object which has a name and a score
 
 */
interface player {
  void setThePlayer(String p);
  void setTheScore(float ss);
  void setTheVerification1();
  void setTheVerification2();
}
class highPlayer implements player {
  String n;
  float s; 
  float v1;
  float v2;
  highPlayer(String thePlayer, float theScore) {
    n = thePlayer;
    s = theScore;
  }
  void setThePlayer(String p) {
    n = p;
  }
  void setTheScore(float ss) {
    s = ss;
  }
  void setTheVerification1() {
    v1 = s%7*10+s%6;
  }
  void setTheVerification2() {
    v2 = s%5*10+s%9; 
  }
}
int numberOfPlays = -1; 
ArrayList peopleWhoPlayed;