void setup(){
  size(400, 20);
  smooth();
  noStroke();
  fill(200,255,200);
  ellipseMode(CORNER);
  frameRate(30);
}

int d = 20;
int x = 0;
int vx = 1;

void draw(){
	int abso = 0;
  background(255);
  ellipse(x, 0, d, d);
  x += vx;
  if(x < 0){
	vx *= -1;
	abso = x * -1;
	x = abso;
  }else if(x > width-d){
	vx *= -1;
	abso = 2 * (width - d) - x;
	x = abso;
  }
}
