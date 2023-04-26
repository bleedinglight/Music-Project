class backGround
{
  float startSize;
  
  ArrayList<backgroundElement> circles = new ArrayList<backgroundElement>();
  
  backGround(int startSize)
  {
    this.startSize = startSize;
    
  }
  
  
  
  void createCircle()
  {
    backgroundElement circleObject = new backgroundElement(startSize);
    circles.add(circleObject);
  }
  
  void Render()
  {
    for(int i = 0; i < circles.size(); i++)
    {
      circles.get(i).Render();
    }
  }
}
