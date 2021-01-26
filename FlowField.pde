class FlowField {
  PVector[][] field;
  int lines, cols;
  int resolution;
  
  FlowField(int res) {
    resolution = res;
    lines = width/resolution;
    cols = height/resolution;
    field = new PVector[cols][lines];
    init();
  }
  
  void init() {
    noiseSeed((int)random(10000));
    float xoff = 0;
    for(int i = 0; i < cols; i++) {
      float yoff = 0;
      for(int j = 0; j < lines; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        xoff ++;
      }
      yoff ++;
    }
  }
  
  void display() {
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < lines; j++) {
        //Vou chamar uma função drawVector(), que desenhara os vetores-linha.
        line(0, j*resolution, i*resolution, 0);
      }
    }
  }
  
  void drawVector() {
    
  
  }

}
