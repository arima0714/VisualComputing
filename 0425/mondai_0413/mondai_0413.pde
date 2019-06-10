void setup(){
  size(400, 400);
  smooth();
  noStroke();
  fill(200,255,200);
  ellipseMode(CORNER);
  frameRate(30);
}

int d = 20;
int x = 0;
int vx = 1;
float dtheta = 0;
float delta = 0.05;

void draw(){
  background(255);
  fivestar(x, height/2, 40, 200,255,200);
  x += vx;
  if(x > width || x < 0){
	vx *= -1;
	delta *= -1;
  }
}

void fivestar(int x, int y, int r, int R, int G, int B){
	smooth();
	beginShape();
		for(int i = 0;i < 5;i++){
			float theta = 2 * TWO_PI / 5 * i - HALF_PI;
			theta += dtheta;
			int x_n;
			int y_n;
			x_n = int(r * cos(theta) + x);
			y_n = int(r * sin(theta) + y);
			vertex(x_n,y_n);
		}
	endShape();
	dtheta += delta;
}
