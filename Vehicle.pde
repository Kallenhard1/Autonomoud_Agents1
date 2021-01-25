class Vehicle {
  PVector Acc;
  PVector Vel;
  PVector Pos;
  float r;
  float maxSpeed;
  float maxForce;
  
  Vehicle(float x, float y) {
    Acc = new PVector(0, 0);
    Vel = new PVector(0, -5);
    Pos = new PVector(x, y);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.2;
  }
  
  void update() {
    Vel.add(Acc);
    
    Vel.limit(maxSpeed);
    
    Pos.add(Vel);
    
    Acc.mult(0);
  
  }
  
  void applyForce(PVector force) {
    Acc.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, Pos);
    desired.setMag(maxSpeed);
    
    PVector steer = PVector.sub(desired, Vel);
    steer.limit(maxForce);
    
    applyForce(steer);
  }
  
  void display() {
    float theta = Vel.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
}
