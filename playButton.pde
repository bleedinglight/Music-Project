//Creating a Play Button Class
//Will make a button that will be able to pause and play a song

class playButton
{
  float x;
  float y;
  float bRad;
  float bSatur;
  AudioPlayer ap;
  
  boolean pause;
  boolean overButton;
  boolean pressed;
  
  playButton(float xPos, float yPos, AudioPlayer songPlayer)
  {
    ap = songPlayer;
    x = xPos;
    y = yPos;
    
    bRad = 50;
    pause = true;
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
      fill(0, 255 - bSatur, 255);
      ap.play();
    }else
    {
      fill(255-bSatur);
      ap.pause();
    }
    noStroke();
    circle(x, y, bRad);
    
    println(overButton);
    println(pause);
    println(pressed);
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
