class Render {
  //Walls walls;
  Source src;
  Render(Source src) {
    //this.walls = walls;
    this.src = src;
  }
  
  void update() {
    noStroke();
    rectMode(CENTER);
    float rect_width = (width/2)/src.ray_cnt;
    int i;
    float x_loc = width/2;
    float rect_len = 0;
    float bright = 0;
    
    for(i = 0; i < src.final_ray_len.length ; i++) {
       x_loc += rect_width;
       float z = src.final_ray_len[i] * cos((i - (src.ray_cnt/2))*(src.FOV/src.ray_cnt));
       rect_len = 10*height/z;
       //rect_len = height - (src.final_ray_len[i]/src.ray_len)*height;
       bright = 255 - (src.final_ray_len[i]/src.ray_len)*255;
       fill(bright);
       rect(x_loc, height/2, rect_width, rect_len);
      
    } 
    
    
  
  }
  
  
  
  
  
}
