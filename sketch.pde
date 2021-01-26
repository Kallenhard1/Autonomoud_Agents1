boolean debug = true;

FlowField flowfield;
ArrayList <Vehicle> vehicles;

void setup() {
  size(600, 600);
  flowfield = new FlowField(20);
  vehicles = new ArrayList<Vehicle>();
  
}

void draw() {
  background(245);
  
  flowfield.init();
}
