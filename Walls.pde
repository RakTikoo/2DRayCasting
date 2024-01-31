class Walls {
  PVector wall_src, wall_end;
  
  Walls(float x1, float x2, float y1, float y2) {
    this.wall_src = new PVector(x1, y1);
    this.wall_end = new PVector(x2, y2);
  }
  
  void update() {
    stroke(255); 
    strokeWeight(1);
    
    line(this.wall_src.x, this.wall_src.y, this.wall_end.x, this.wall_end.y);
  }
  

}
