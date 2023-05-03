class backGround
{
  float startSize, circleSpeed, circleWeight, circleGap, targetWidth, lerpedBuffer;
  
  AudioPlayer ap;
  AudioBuffer ab;
  
  ArrayList<backgroundElement> circles = new ArrayList<backgroundElement>();
  
  backGround(float startSize, float circleSpeed, float circleWeight, float circleGap, float targetWidth, AudioPlayer ap, AudioBuffer ab)
  {
    this.startSize = startSize;
    this.circleSpeed = circleSpeed;
    this.circleWeight = circleWeight;
    this.circleGap = circleGap;
    this.targetWidth = targetWidth;
    this.ap = ap;
    this.ab = ab;
  }
  
  
  
  void createCircle()
  {
    
    
    backgroundElement circleObject = new backgroundElement(startSize, circleWeight, targetWidth, map(lerpedBuffer, 0, 1, 2*-PI, 2*PI));
    circles.add(circleObject);
  }
  
  void Render()
  {
    float total = 0;
  for (int i = 0; i < ab.size(); i++) {
     total += abs(ab.get(i));
  }
  
  lerpedBuffer = lerp(lerpedBuffer, total / (float) ab.size(), 0.1f);
    
    
    boolean spawnNew = true;
    
    for(int i = 0; i < circles.size(); i++)
    {
      backgroundElement currentObj = circles.get(i);
      currentObj.Render();
      
      if(ap.isPlaying())
      {
      float currentSpeed = map(lerpedBuffer, 0, 1, circleSpeed, circleSpeed*10)-map(abs(ap.getGain()), 0, 60, 0, 2);  
      
      currentObj.Update(currentSpeed);
      }
      
      if(currentObj.radius < targetWidth)
      {
        circles.remove(i);
      }
      
      if(currentObj.radius > startSize - circleGap)
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
