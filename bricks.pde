//bricks 
class rowBrick implements Brick 
{
  float x, y; 
  rowBrick(float xPos, float yPos)
  { 
    x = xPos;
    y = yPos;
  }
  void display() //display the bricks
  {
    stroke(0);
    fill(0,60,255);
    image(img1,x, y);
  }
  boolean intersect(float bx, float by) //function for intersect ball with brick. bx and by are balls co-ordinates
  {
    float p1 = x; //left edge of brick
    float p2 = x + 50; //right edge of brick 
    if ((by >= y) && (by <= y + 32))
    {
      if ((bx >= p1) && (bx <= p2))
      {
        errorList.add("if ((bx >= p1) && (bx <= p2)) {"); 
        errorList.add("  return true;" + char(10) + "}");    
        labelList(); 
        return true; //ball has intersected with brick
      }
      else
      {
        return false; //ball has not intersected with brick
      }
    }
    else
    {
      return false; //ball has not intersected with brick
    }
 
   }
    
}
