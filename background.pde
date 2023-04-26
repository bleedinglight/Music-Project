class background
{
  float startSize;
  
  ArrayList<backgroundElement> circles;
  
  background(int startSize)
  {
    this.startSize = startSize;
    
    circles = new ArrayList<backgroundElement>();
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
