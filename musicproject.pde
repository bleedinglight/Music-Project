import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Setting up the Main Song
Minim mainSong;
AudioPlayer songAP;
AudioBuffer songAB;

playButton test;


void setup()
{
  size(1280, 720, P3D);
  colorMode(HSB);
  
  mainSong = new Minim(this);
  
  songAP = mainSong.loadFile("Sewerslvt - Pretty Cvnt.mp3", 512);
  
  test = new playButton(0+100, height-50, songAP);
}

void draw()
{



  background(0);
  
  fill(100);
  rect(0, height-100, width, 100);
  
  test.render();
}

void mousePressed()
{
  test.click();

}
