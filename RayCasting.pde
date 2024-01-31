Walls[] walls;
int wall_cnt;

Source src;
Render rend;
void setup() {
  size(1000, 500);
  wall_cnt = 10;
  walls = new Walls[wall_cnt];
  
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Walls(random(0, width/2), random(0, height), random(0, width/2), random(0, height));
  }
  
  // Make 4 boundaries
  walls[0].wall_src.x = 0;
  walls[0].wall_src.y = 0;
  walls[0].wall_end.x = 0;
  walls[0].wall_end.y = height;
  
  walls[1].wall_src.x = 0;
  walls[1].wall_src.y = 0;
  walls[1].wall_end.x = width/2;
  walls[1].wall_end.y = 0;
  
  walls[2].wall_src.x = width/2;
  walls[2].wall_src.y = 0;
  walls[2].wall_end.x = width/2;
  walls[2].wall_end.y = height;
  
  walls[3].wall_src.x = 0;
  walls[3].wall_src.y = height;
  walls[3].wall_end.x = width/2;
  walls[3].wall_end.y = height;
  
  
  
   src = new Source(walls);
   rend = new Render(src);
  
}


void draw() {
  background(0);
  for(int i = 0; i < walls.length; i++) {
    walls[i].update();
  }
  src.update();
  rend.update();
  
} 
