class backgroundElement
{
  float radius, circleWidth, startRad;
  
  

  backgroundElement(float startRadius, float circleWidth)
  {
    this.radius = startRadius;
    this.circleWidth = circleWidth;
    this.startRad = startRadius;
  }

  void Render()
  {
    colorMode(HSB);

    //background(0);

    int startX = width/2;
    int startY = height/2;

    float theta = 0.7f;

    //float cGap = 100.0f / 360.0f ;

    //println(cGap);
    
    float distanceSB = map(radius, startRad, width/2, 0, 360);

    strokeWeight(2);
    for (float i = 0; i < 360; i += theta)
    {

      stroke(i, 360, distanceSB);
      point(startX + sin(radians(i)) * radius, startY + cos(radians(i)) * radius);
    }
  }
  
  void Update(float speed)
  {
    radius += speed;
  }
}
