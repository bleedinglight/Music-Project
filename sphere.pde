class ball {
  
  float radius;
  color colour;
  PVector position;
  float rotationSpeed;
  float theta;
  
  
  ball(float radius, color colour, float x, float y, float rotationSpeed) {  
    
    this.radius = radius;
    this.colour = colour;
    this.position = new PVector(x, y);
    this.rotationSpeed = rotationSpeed;
    theta = 0;
    
  }
  
  void render() {
    
    strokeWeight(1);
    stroke(colour);
    noFill();
    pushMatrix();
    translate(position.x, position.y);
    rotateX(theta);
    rotateY(theta);
    sphere(radius);
    popMatrix();
    
  }
  
  void update() {
    
    theta += rotationSpeed;
    println(theta);
    
  }
  
}
