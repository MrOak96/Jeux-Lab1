int nbMovers = 50;

Mover[] movers;
Fluid fluid;
Mover balloon;
boolean fluidOn;

void setup () {
  
  size (800, 600);
  movers = new Mover[nbMovers];
  balloon = new Mover(width/2, height/2, 5, 155, 0, 0);
  
  for (int i = 0; i < movers.length; i++)
    movers[i] = new Mover(random(width), 0, random(0.1, 5), (int) random(255), (int) random(255), (int) random(255));
    
  fluidOn = false;
  fluid = new Fluid();
  
}

void draw () {
  
  update();
  background(130);

  for (int i = 0; i < movers.length; i++)
    movers[i].display();
    
  balloon.display();
  
  if(fluidOn)
    fluid.display();
  
}

void update() {
  
  PVector wind = new PVector (0, 0);
  
  if (mousePressed) {
    if (mouseButton == LEFT) {
      wind = new PVector (0.1, 0);
    }
    else if (mouseButton == RIGHT) {
      wind = new PVector (-0.1, 0);
    }
  }
  
  for (int i = 0; i < movers.length; i++) {
    
    float m = movers[i].mass;
    PVector gravity = new PVector (0, 0.1 * m);
    
    if(movers[i].location.y > (height - fluid.h) && fluidOn){
      
      PVector f = new PVector(movers[i].velocity.x, movers[i].velocity.y);
      f.normalize();
      f.mult(-1 * fluid.density * 0.1 * movers[i].velocity.mag() * movers[i].velocity.mag() * movers[i].mass * 0.5);
      movers[i].applyForce(f);
   
    }
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
      
  }
  
  float m = balloon.mass;
  PVector gravity = new PVector (0, 0.1*m);
  
  balloon.applyForce(wind);
  balloon.applyForce(new PVector(0, -0.13*m));
  balloon.applyForce(gravity);
  balloon.update();
  balloon.checkEdges();
  
}

void keyPressed() {
  if (key == 'r') {
    fluidOn = false;
    for (int i = 0; i < movers.length; i++)
      movers[i] = new Mover(random(width), 0, random(0.1, 5), (int) random(255), (int) random(255), (int) random(255));
    balloon = new Mover(width/2, height/2, 5, 155, 0, 0);
  } else if (key == ' ') {
    if (fluidOn) {
      fluidOn = false;
    }
    else {
      fluidOn = true;
      fluid = new Fluid();
    }
  }
}
