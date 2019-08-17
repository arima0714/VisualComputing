void fivestar (int x, int y, int r, int R, int G, int B) {
  smooth();
  beginShape();
  for(int i = 0;i< 5;i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    int x_n;
    int y_n;
    x_n = int(r * cos(theta) + x);
    y_n = int(r * sin(theta) + y);
    vertex(x_n,y_n);
  }
  endShape();
}

void setup(){
  noStroke();

  size(300 , 200);
  background(255, 255, 255);

  // draw red line
  fill(255,0,0);
  rect(0,0,300,100);
  
  // draw white circle
  fill(255);
  ellipse(50, 50, 60, 60);
  
  // draw red circle
  fill(255,0,0);
  ellipse(65, 50, 65,65);
  
  // draw 5 FiveStars
  fill(255);
  for(int i = 0;i< 5;i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    int x,y;
    int r = 20;
    x = int(r * cos(theta) + 65);
    y = int(r * sin(theta) + 50);
    fivestar(x, y, 7, 255 ,0, 0);
  }
}
