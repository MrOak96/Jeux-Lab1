class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topSpeed;
  float mass;
  
  int r;
  int g;
  int b;
  
  Mover(float x, float y, float m, int r, int g, int b) {
    
    this.location = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass = m;
    this.r = r;
    this.g = g;
    this.b = b;
    
  }
  
  void update () {
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
  }
  
  void display () {
    
    stroke(0);
    fill (r, g, b, 127);
    ellipse (location.x, location.y, mass * 16, mass * 16); // Dimension à l'échelle de la masse
    
  }
  
  void checkEdges() {
    
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    
    if (location.y > height) {
      velocity.y *= -0.9; // Restitution de 90%
      location.y = height;
    }
    
    if (location.y - (mass*8) < 0) {
      velocity.y *= -0.9;
      location.y = (mass*8);
    }
    
  }
  
  
  void applyForce (PVector force) {
    
    PVector f = PVector.div(force, mass);
    this.acceleration.add(f);
    
  }
}
