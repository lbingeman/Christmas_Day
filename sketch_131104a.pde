import g4p_controls.*;
import ddf.minim.*; 
String name;
boolean highScoreNameEnter = false; 
ArrayList names;
ArrayList errorList; 
int numberOfNames = 0; 
Minim minim;
AudioPlayer song;
AudioPlayer song1;
RedBall ball1 = new RedBall(100, 200, 10);
levelBricks levels = new levelBricks(); 
gun theGun = new gun();
float time = 0; 
boolean pause = false;
PImage img; 
PImage img1;
PImage startImg;
float theLevel = 1;
PFont f;
float score = 0; 
float lengthOfBar = 25;
boolean shouldISetX = false;
boolean start = true; 
boolean gameOver = false;
ArrayList bricks; 
ArrayList multiBalls;
boolean gameStart = false;
boolean soundRun = false; 
int count = 0;
int numberOfBalls = 0; 
boolean gameFinished = false;
boolean shouldMuteMusic = true;
largeBar largebar = new largeBar(0, 0, 10);
ballPowerUp ballMulti = new ballPowerUp(0, 0, 10);
interface boom { //interface for the gun
  void shoot();
  void make();
  void yPosi();
  void shouldIKeepDrawing();
}

interface bricksLevel { //interface for the brick levels
  void nextLevel(float levelNumber);
}
interface Brick { //interface for bricks
  void display();
  boolean intersect(float numberX, float numberY);
}


void setup()
{
  //createGUI();
  frameRate(100);
  img = loadImage("background.gif"); //load background
  startImg = loadImage("christmasDay.jpg"); //load starting rule screen
  img1 = loadImage("Gifts.png"); //load gifts
  bricks = new ArrayList(); //create an array of bricks
  peopleWhoPlayed = new ArrayList(); //create array of names
  multiBalls = new ArrayList(); //create array of balls
  errorList = new ArrayList(); //create an array of text for the code display
  for ( int i = 0; i < 10; i++) {
    otherBall b = new otherBall(100, 200, 10);
    multiBalls.add(b);
  } 
  for (int i = 0; i < 7; i++)
  {
    rowBrick b = new rowBrick((50*i) + 75, 90);
    bricks.add(b);
  } 
  size(500, 500);
  f = createFont("Arial", 16, true); //create a font
  minim = new Minim(this); //music code
  song = minim.loadFile("Jingle Bells.mp3"); //load background music
  song1 = minim.loadFile("Bells.mp3"); //load hit music
  //start playing background music
  song.play(); 
  song.loop(); 
  //initiaze hit music
  song1.play();
  song1.loop();
  song1.mute();
}
void stop() //code for stopping music 
{
  minim.stop();
  song.close();
  song1.close();
  super.stop();
}