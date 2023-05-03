//Creating a Play Button Class
//Will make a button that will be able to pause and play a song

class button
{
  float x;
  float y;
  float bRad;
  float bSatur;
  AudioPlayer ap;
  
  boolean pause;
  boolean overButton;
  boolean pressed;
  String buttonName;
  
  button(float xPos, float yPos, AudioPlayer songPlayer, String name)
  {
    ap = songPlayer;
    x = xPos;
    y = yPos;
    
    bRad = 50;
    pause = true;
    buttonName = name;
  }
  
  void render()
  {
    mouseCheck();
    
    if(overButton)
    {
      bSatur = 50;
    }else
    {
      bSatur = 0;
    }
    
    if(!pause)
    {
      ap.play();
    }else
    {
      fill(255-bSatur);
      ap.pause();
    }
    
    if(ap.isPlaying())
    {
      fill(0, 255 - bSatur, 255);
    }
    
    noStroke();
    circle(x, y, bRad);
    
    println(overButton);
    println(pause);
    println(pressed);
    
    
    textSize(18);
    fill(360);
    text(buttonName, x-bRad/2-9, y-bRad/2-3);
  }
  
  public void click()
  { 
    if(overButton)
    {
      pause = !pause;
    }
  }
  
  public void mouseCheck()
  {
    if(mouseX>= x-bRad/2 && mouseX<= x+bRad/2 && mouseY>= y-bRad/2 && mouseY<= y+bRad/2)
    {
      overButton = true;
    }else
    {
      overButton = false;
    }
  }
}
