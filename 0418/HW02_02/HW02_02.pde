void sixstar(int x_0, int y_0, int r, int R, int G, int B){
  fill(R,G,B);
  smooth();
  beginShape();
  for(int i = 0; i < 3;i++){
  int x_n,y_n;
  float theta = 2 * TWO_PI / 3 * i + HALF_PI;
  x_n = int(r * cos(theta) + x_0);
  y_n = int(r * sin(theta) + y_0);
  vertex(x_n,y_n);
  }
  endShape();
  beginShape();
  for(int i = 0; i < 3;i++){
  int x_n,y_n;
  float theta = 2 * TWO_PI / 3 * i - HALF_PI;
  x_n = int(r * cos(theta) + x_0);
  y_n = int(r * sin(theta) + y_0);
  vertex(x_n,y_n);
  }
  endShape();
}


void setup(){
  
  int diff;

//background is white
size(500,300);
background(255);
noStroke();

//draw red triangle x 2
fill(255, 0, 0);
smooth();
diff = 20;
triangle(25,0, 475,0, 250,150-diff);
triangle(25,300, 475,300, 250,150+diff);

//draw green triangle x 2
diff = 20;
fill(0, 255, 0);
smooth();
triangle(0,20, 0,280, 250-diff,150);
triangle(500,20, 500,280, 250+diff,150);

//draw white circle in center
fill(255);
ellipse(250, 150, 160, 160);

//draw sixstar x 3
  for(int i = 0; i < 3;i++){
  int x_n,y_n;
  int r = 40;
  float theta = 2 * TWO_PI / 3 * i - HALF_PI;
  x_n = int(r * cos(theta) + 250);
  y_n = int(r * sin(theta) + 150);
  sixstar(x_n, y_n, 20, 0,255,0);
  sixstar(x_n, y_n, 15, 255,0,0);
  }
}
