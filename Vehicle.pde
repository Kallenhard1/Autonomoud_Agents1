class Vehicle {
  PVector Acc;
  PVector Vel;
  PVector Pos;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(PVector l, float ms, float mf) {
    Pos = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    Acc = new PVector(0, 0);
    Vel = new PVector(0, 0);
  }
  
  public void run() {
    update();
    borders();
    display();
    
  }
  
    void follow(FlowField flow) {
    PVector desired = flow.lookup(Pos);
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired, Vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void update() {
    Vel.add(Acc);
    
    Vel.limit(maxspeed);
    
    Pos.add(Vel);
    
    Acc.mult(0);
  
  }
  
  void applyForce(PVector force) {
    Acc.add(force);
  }
  
  
  void display() {
    float theta = Vel.heading2D() + PI/2;
    fill(175);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void borders() {
    if(Pos.x < -r) Pos.x = width + r;
    if(Pos.y < -r) Pos.y = height + r;
    if(Pos.x > width + r) Pos.x = - r;
    if(Pos.y > height + r) Pos.y = -r;
  }
}
