class Source {
 
  PVector ray_src;
  PVector[] ray_end;
  
  int ray_cnt = 100;
  
  float ray_len = sqrt(width*width + height*height + 10); // bigger than diagonal
  
  float FOV = PI/4;
  
  float view_angle = 0;
  
  Walls[] walls;
  
  
  // Constructor
  Source(Walls[] walls) {
    this.ray_src = new PVector(0, 0);
    this.ray_end = new PVector[ray_cnt];
    
    for (int i = 0; i < this.ray_end.length; i++) {
      this.ray_end[i] = new PVector(0, 0);
    }
    
     this.walls = walls;
    
  }
  
  
  // Intersection logic
  float intersect(PVector line1_src, PVector line1_end, PVector line2_src, PVector line2_end) {
     float x1 = line1_src.x;
     float x2 = line1_end.x;
     float x3 = line2_src.x;
     float x4 = line2_end.x;
     
     float y1 = line1_src.y;
     float y2 = line1_end.y;
     float y3 = line2_src.y;
     float y4 = line2_end.y;
     
     float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
     float dist = this.ray_len;
     
     if(den != 0) {
     
       float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4))/den;
       float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3))/den;
       
        // Intersection condition
       if(t >= 0 && t <= 1 && u >= 0 && u <= 1) {
         float i_x = x1 + t*(x2 - x1);
         float i_y = y1 + t*(y2 - y1);
         
         dist = sqrt((x1 - i_x)*(x1 - i_x) + (y1 - i_y)*(y1 - i_y));
         
       }
      
      
     }
     
     return dist;
  }
  
  
  
  
  void update() {
    this.ray_src.x = mouseX;
    this.ray_src.y = mouseY;
    
    // Rays    
    strokeWeight(1);
    stroke(255, 125);
    float angle = view_angle;
    
    if(keyPressed && (key == 'd' || key == 'D')) {
      this.view_angle += 0.05;
    }
    else if(keyPressed && (key == 'a' || key == 'A')) {
      this.view_angle -= 0.05;
    }
    
    
    
    for(int i = 0; i < this.ray_end.length; i++) {
      
      
      // Check intersection with walls
      float min_dist = ray_len;  
      // Initialize ray_end
      this.ray_end[i].x = this.ray_src.x + min_dist*cos(angle);
      this.ray_end[i].y = this.ray_src.y + min_dist*sin(angle);
      
      for(int j = 0; j < walls.length; j++) {
        float new_dist = intersect(this.ray_src, this.ray_end[i], walls[j].wall_src, walls[j].wall_end);
        if (new_dist < min_dist) min_dist = new_dist;
      }
      
      // Update ray_end
      this.ray_end[i].x = this.ray_src.x + min_dist*cos(angle);
      this.ray_end[i].y = this.ray_src.y + min_dist*sin(angle);
      
      // Draw rays
      line(this.ray_src.x, this.ray_src.y, this.ray_end[i].x, this.ray_end[i].y);
      angle += (FOV/ray_cnt);
      
      
    }    
  }
  
  
  

}
