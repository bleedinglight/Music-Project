import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


ArrayList<AudioPlayer> audioAP = new ArrayList<AudioPlayer>();
ArrayList<AudioBuffer> audioAB = new ArrayList<AudioBuffer>();
ArrayList<button> buttons = new ArrayList<button>();
ArrayList<volumeCtrl> volume = new ArrayList<volumeCtrl>();

Minim minim;

AudioPlayer songAP;
AudioPlayer sfx1AP;
AudioPlayer sfx2AP;

AudioBuffer songAB;
AudioBuffer sfx1AB;
AudioBuffer sfx2AB;

int objNum = 3;

void initDjBooth()
{
  for(int i = 0; i<objNum; i++)
  {
    String butName;
    String volName;
    
    switch (i)
    {
      case 0:
      audioAP.add(songAP = minim.loadFile("Sewerslvt - Pretty Cvnt.mp3", 512));
      audioAB.add(songAB = songAP.mix);
      
      butName = "Song Button";
      volName = "Song Volume";
      
      buttons.add(new button(150+150*i, height-50, audioAP.get(i), butName, false));
      volume.add(new volumeCtrl(600+150*i, height-10, audioAP.get(i), volName));
      break;
      
      case 1:
      audioAP.add(sfx1AP = minim.loadFile("Scratch1.mp3", 512));
      audioAB.add(sfx1AB = sfx1AP.mix);
      
      butName = "Sfx1 Button";
      volName = "Sfx1 Volume";
      
      buttons.add(new button(150+150*i, height-50, audioAP.get(i), butName, true));
      volume.add(new volumeCtrl(600+150*i, height-10, audioAP.get(i), volName));
      break;
      
      case 2:
      audioAP.add(sfx2AP = minim.loadFile("Airhorn.mp3", 512));
      audioAB.add(sfx2AB = sfx2AP.mix);
      
      butName = "Sfx2 Button";
      volName = "Sfx2 Volume";
      
      buttons.add(new button(150+150*i, height-50, audioAP.get(i), butName, true));
      volume.add(new volumeCtrl(600+150*i, height-10, audioAP.get(i), volName));
      break;
    }
  }
}

void renderDjBooth()
{
  for(int i = 0; i<objNum; i++)
  {
    buttons.get(i).render();
    volume.get(i).render();
    volume.get(i).update();
  }
}

backGround bgObject;
ball ball;

ArrayList<ball> balls = new ArrayList<ball>();

int ballAmount = 1;

void setup()
{
  //size(1280, 720, P3D);
  fullScreen(P3D);
  colorMode(HSB, 360);
  
  minim = new Minim(this);
  
  initDjBooth();
  
  lights();
  
  drawBalls(ballAmount);

  
  bgObject = new backGround(sqrt(pow(width/2, 2) + pow(height/2, 2)) + 10, 1, 4, 5, 20, audioAP.get(0), audioAB.get(0));

}

//ball generator
void drawBalls(int number) {
  
  for(int i = 0; i < number; i++) {
      ball ball = new ball(0, 0, width / 2, height / 2, 0);
      balls.add(ball);
  }
  
}

float lerpedBuffer;

void draw()
{
  background(0);
  
  fill(100);
  rect(0, height-100, width, 100);
  
  //awesome lerp gaming
  float total = 0;
  for(int j = 0; j< 3; j++)
  {
    for (int i = 0; i < audioAB.get(j).size(); i++) 
    {
         total += abs(audioAB.get(j).get(i));
    }
  }
  
  lerpedBuffer = lerp(lerpedBuffer, total / (float) songAB.size(), 0.1f);
  
  //balls iteration
  for (int i = 0; i < balls.size(); i++) {
     for(int j =0; j<3; j++)
     {
     ball ball = balls.get(i);
     ball.radius = map(lerpedBuffer/map(abs(audioAP.get(j).getGain()), 0, 60, 0.8, 5), 0, 1, 10, 400);
     ball.colour = color(map(lerpedBuffer, 0, 1, 260, 320), 255, 255);
     ball.rotationSpeed = map(lerpedBuffer, 0, 1, 0, 0.5);
     
     ball.render();
     ball.update();
     }
  }
  bgObject.Render();
  
  
  int gradient = 10;
  
  noStroke();
  for(int i = 0; i<gradient; i++)
  {
    for(int j = 0; j<3; j++)
    {
      float tot = 0;
      for(int k = 0; k < audioAB.get(j).size(); k++)
      {
        tot += abs(audioAB.get(0).get(k));
      }
      
      float lerp = lerp(abs(audioAP.get(j).getGain()), tot/audioAB.get(j).size(), 0.1f);
      fill(map(lerp/abs(audioAP.get(j).getGain())*0.1f, 0, 1, 100, 120)- 120/gradient*i);
    }
    rect(0, height-100 + 100/gradient*i, width, 100);
  }
  
  renderDjBooth();
}

void mousePressed()
{
  for(int i = 0; i < 3; i ++)
  {
    buttons.get(i).click();
  }
}

void mouseDragged()
{
  for(int i = 0; i < 3; i ++)
  {
    volume.get(i).volumeDrag();
  }
}
