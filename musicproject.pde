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

ball ball;

ArrayList<ball> balls = new ArrayList<ball>();

int ballAmount = 1;

void setup()
{
  size(1280, 720, P3D);
  colorMode(HSB, 360);
  
  mainSong = new Minim(this);
  
  songAP = mainSong.loadFile("Sewerslvt - Pretty Cvnt.mp3", 512);
  
  test = new playButton(0+100, height-50, songAP);
  
  lights();
}

void drawBalls(int number) {
  
  for(int i = 0; i < number; i++) {
      ball ball = new ball(0, 0, width / 2, height / 2);
      balls.add(ball);
  }
  
}

float lerpedBuffer;

void draw()
{
  background(0);
  
  fill(100);
  rect(0, height-100, width, 100);
  
  float total = 0;
  for (int i = 0; i < songAB.size(); i++) {
     total += abs(songAB.get(i));
  }
  
  lerpedBuffer = lerp(lerpedBuffer, total / (float) songAB.size(), 0.1f);
  
  for (int i = 0; i < balls.size(); i++) {
     ball ball = balls.get(i);
     ball.radius = map(lerpedBuffer, 0, 1, 100, 500);
     ball.colour = color(map(lerpedBuffer, 0, 1, 0, 255), 255, 255);
  }
  
  test.render();
  ball.render();
}

void mousePressed()
{
  test.click();
}
