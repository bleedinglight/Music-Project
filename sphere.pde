class ball {
  
  float radius;
  color colour;
  PVector position;
  
  
  ball(float radius, color colour, float x, float y) {  
    
    this.radius = radius;
    this.colour = colour;
    this.position = new PVector(x, y);
    
  }
  
  void render() {
    
    stroke(colour);
    noFill();
    translate(position.x, position.y);
    sphere(radius);
    
  }
  
  
  
  
  
  
  
}
