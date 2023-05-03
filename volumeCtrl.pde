//Class for making vertical volume sliser

class volumeCtrl
{
  float barW = 10;
  float barH = 10;

  float slidW = 8;
  float slidH = 80;
  float slidX;
  float slidY;
  float slidColor;
  
  float barMax;
  float barPos;
  boolean overBar;
  
  float barValue;
  float gainValue;
  
  String ctrlName;
  
  AudioPlayer ap;
  
  volumeCtrl(float xpos, float ypos, AudioPlayer audio, String name)
  {
    slidX = xpos;
    slidY = ypos;
    ap = audio;
    ctrlName = name;
    barMax = ypos-80;
    barPos = ypos-60;
  }
  
  void render()
  {
    noStroke();
    fill(125);
    rect(slidX, barMax, slidW, barPos-barMax);
    fill(120, 360, 255);
    rect(slidX, slidY, slidW, -(slidY-barPos));
    
    noStroke();
    if(!overBar)
    {
      fill(360);
    }else{
      fill(255);
    }
    rect(slidX, barPos, barW, -barH);
    
    fill(360);
    textSize(14);
    text(ctrlName, slidX+20, slidY-40);
    
    println(barValue);
    println(overBar);
    println(ap.getGain());
  }
  
  void mouseOver()
  {
    if(mouseX>= slidX && mouseX<= slidX+barW && mouseY>=barPos-barH && mouseY<=barPos)
    {
      overBar = true;
    }else{
      overBar = false;
    }
  }
  
  void volumeDrag()
  {
    if(overBar == true && barPos >= barMax && barPos <= slidY)
    {
      barPos = mouseY;
      
      if(barPos <= barMax-1)
      {
        barPos = barMax;
      }
      
      if(barPos >= slidY+1)
      {
        barPos = slidY;
      }
    }
  }
  
  void update()
  {
    mouseOver();
    
    barValue = (slidY-barPos)/80;
    
    gainValue = map(barValue, 0, 1, -40, 6);
    
    ap.setGain(gainValue);
  }
}
