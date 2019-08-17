void star(){
  beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    vertex(.5 * cos(theta), .5 * sin(theta));
  }
  endShape();
}

void setup(){
  noStroke();
  size(300,200);
  background(255,0,0);
  fill(255,255,0);
  //drow large star
  int large_star_x;
  int large_star_y;
  large_star_x = width / 2;
  large_star_y = height / 2;
  large_star_x = large_star_x / 15 * 5;
  large_star_y = large_star_y / 2;
  int small_x = width / 2 / 15;
  int small_y = height / 2 / 10;
  pushMatrix();
  translate(large_star_x, large_star_y);
  scale(width * 3 / 10 / 2,width * 3 / 10 / 2);
  star();
  popMatrix();
  //drow small star
  int small_scale = 15;
  pushMatrix();
  translate(small_x * 10, small_y * 2);
  scale(small_scale,small_scale);
  rotate(PI/6);
  star();
  popMatrix();
  pushMatrix();
  translate(small_x * 12, small_y * 4);
  scale(small_scale,small_scale);
  rotate(PI/6*4);
  star();
  popMatrix();
  pushMatrix();
  translate(small_x * 12, small_y * 7);
  scale(small_scale,small_scale);
  star();
  popMatrix();
  pushMatrix();
  translate(small_x * 10, small_y * 9);
  scale(small_scale,small_scale);
  rotate(PI/6);
  star();
  popMatrix();
}
