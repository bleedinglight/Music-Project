import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Set Up
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

void setup()
{
  size(1280, 720, P3D);
  colorMode(HSB, 360);
  
  minim = new Minim(this);
  
  initDjBooth();
}

void draw()
{
  background(0);
  
  for(int i =0; i< 3; i++)
  {
    float boothFill = 100 + 10 *0.001*audioAB.get(i).size()*audioAP.get(i).getGain();
    
    fill(boothFill);
  }
  
  rect(0, height-100, width, 100);
  
  renderDjBooth();
}

void mousePressed()
{
  for(int i = 0; i<objNum; i++)
  {
    buttons.get(i).click();
  }
}

void mouseDragged()
{
  for(int i = 0; i<objNum; i++)
  {
    volume.get(i).volumeDrag();
  }
}
