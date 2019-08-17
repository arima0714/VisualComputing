void setup(){
  size(20, 400);
  smooth();
  noStroke();
  fill(200,255,200);
  ellipseMode(CORNER);
  frameRate(30);
}

int d = 20;
int y = 0;
int vy = 1;

void draw(){
	int abso = 0;
  background(255);
  ellipse(0, y, d, d);
  y += vy;
  if(y < 0){
	vy *= -1;
	abso = y * -1;
	y = abso;
  }else if(y > height-d){
	vy *= -1;
	abso = 2 * (height - d) - y;
	y = abso;
  }
}
