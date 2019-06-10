size(200,100);
background(0, 0, 255);
noStroke();

// drow white line * 2
fill(255);
rect(0,20,200,20);
rect(0,60,200,20);
// draw red triangle on left
fill(255,0,0);
triangle(0,0, 0,100, 86,50);

// draw five star on center of red triangle
fill(255);
smooth();
int r = 20;
beginShape();
  for(int i = 0;i < 5;i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    int x,y;
    x = int(r * cos(theta)) + 30 ;
    y = int(r * sin(theta)) + 50;
    vertex(x,y);
  }
endShape();
