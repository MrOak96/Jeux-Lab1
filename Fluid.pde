class Fluid {
  
  float density;
  float h;
  
  Fluid(){

    this.density = random(1.5, 3); // Densité entre 1.5 et 3
    this.h = random(0.1, 0.4) * height; // Hauteur entre (0.1 * height) et (0.4 * height)
    
  }
  
  void display(){
    
    noStroke();
    fill (127, 200, 255, 127);
    rect(0, height - h, width, h);
    
    displayText();
    
  }
  
  void displayText(){
    
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    text("Densité : " + density +"\nGabriel Deschesnes", width/2, height - (h/2));
    
  }
    
}
