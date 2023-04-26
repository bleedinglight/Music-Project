class backGround
{
  float startSize, circleSpeed, circleWidth, circleGap;
  
  ArrayList<backgroundElement> circles = new ArrayList<backgroundElement>();
  
  backGround(float startSize, float circleSpeed, float circleWidht, float circleGap)
  {
    this.startSize = startSize;
    this.circleSpeed = circleSpeed;
    this.circleWidth = circleWidth;
    this.circleGap = circleGap;
  }
  
  
  
  void createCircle()
  {
    backgroundElement circleObject = new backgroundElement(startSize, circleWidth);
    circles.add(circleObject);
  }
  
  void Render()
  {
    boolean spawnNew = true;
    
    for(int i = 0; i < circles.size(); i++)
    {
      backgroundElement currentObj = circles.get(i);
      currentObj.Render();
      currentObj.Update(circleSpeed);
      
      if(currentObj.radius > width/1.5)
      {
        circles.remove(i);
        println("===================================================================== circle deleted");
      }
      
      if(currentObj.radius < startSize + circleGap)
      {
        spawnNew = false;
      }
    }
    
    if(spawnNew)
    {
      createCircle();
    }
  }
}
