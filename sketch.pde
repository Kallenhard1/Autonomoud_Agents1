boolean debug = true;

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(600, 600);
  flowfield = new FlowField(20);
  vehicles = new ArrayList<Vehicle>();
  
  for(int i = 0; i < 120; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }

}

void draw() {
  background(245);
  
  if (debug) flowfield.display();
  
  //This calling function may will "lookup" to the 'flowfield' position vector(that is the vehicle position). 
  for(Vehicle v : vehicles) {
  v.follow(flowfield);
  v.run();
  }
  
  fill(0);
  //text();
}

void keypressed() {
  if(key == ' ') {
    debug = !debug;
  }
}
  
void mousePressed() {
  flowfield.init();
}
