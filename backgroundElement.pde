class backgroundElement
{
  float radius, circleWidth, furthestRad, rot;
  
  

  backgroundElement(float startRadius, float circleWidth, float furthestRad, float rot)
  {
    this.radius = startRadius;
    this.circleWidth = circleWidth;
    this.furthestRad = furthestRad;
    this.rot = rot;
  }

  void Render()
  {
    int startX = width/2;
    int startY = height/2;
    
    pushMatrix();
    
    translate(startX, startY);
    rotate(rot);
    
    colorMode(HSB);

    //background(0);

    

    float theta = 3f;

    //float cGap = 100.0f / 360.0f ;

    //println(cGap);
    
    //float distanceS = map(radius, furthestRad, width/2.5, 50, 360);
    float distanceB = map(radius, furthestRad, width/2.5, 100, 360);
    float currentWidth = map(radius, furthestRad, width/2.5, 1, circleWidth);

    strokeWeight(currentWidth);
    for (float i = 0; i < 360; i += theta)
    {

      stroke(i, 360, distanceB);
      point(sin(radians(i)) * radius, cos(radians(i)) * radius);
    }
    
    popMatrix();
  }
  
  void Update(float speed)
  {
    radius -= speed;
  }
}
