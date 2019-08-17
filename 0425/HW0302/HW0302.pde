void setup(){
	size(500,500);
	smooth();
	noStroke();
	ellipseMode(CORNER);
	fill(200,255,200);
	frameRate(30);
}

float d = 20;
float x = 0;
float y = 0;
float vx = 3;
float vy = 0;

void draw(){
	background(255);
	ellipse(x,y,d,d);
	// x-axis
	x += vx;
	if(x < 0 || x + d > width){
		vx *= -0.8;
		if(x < 0){
			x *= -1;
		}
		else if(x + d > width){
			x = 2 * (width - d) - x;
		}
	}
	// y-axis
	vy += 1;
	y += vy;
	if(y + d > height){
		vy *= -0.8;
		y = 2 * (height - d) - y;
	}
}
