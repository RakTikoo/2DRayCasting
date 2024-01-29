Walls[] walls;
int wall_cnt;

Source src;

void setup() {
  size(500, 500);
  wall_cnt = 5;
  walls = new Walls[wall_cnt];
  
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new Walls(random(0, width), random(0, height), random(0, width), random(0, height));
  }
  
   src = new Source(walls);
  
}


void draw() {
  background(0);
  for(int i = 0; i < walls.length; i++) {
    walls[i].update();
  }
  src.update();
  
} 
