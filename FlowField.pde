class FieldFlow {
  int res;
  int lines, cols;
  lines = float(width/res);
  cols = float(height/res);
  PVector[][] field;
  
  FieldFlow() {
    res = 100;
    field = new PVector[lines][cols];
    
  }
}
