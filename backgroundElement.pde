class backgroundElement
{
  float radius;

  backgroundElement(float startRadius)
  {
    this.radius = startRadius;
  }

  void Render()
  {
    colorMode(HSB);

    //background(0);

    int startX = width/2;
    int startY = height/2;

    float theta = 0.2f;

    //float cGap = 100.0f / 360.0f ;

    //println(cGap);

    strokeWeight(2);
    for (float i = 0; i < 360; i += theta)
    {

      stroke(i, 360, 360);
      point(startX + sin(radians(i)) * radius, startY + cos(radians(i)) * radius);
    }
  }
  
  void Update(int speed)
  {
    radius += speed;
  }
}
