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
int darc = 30;
int ddarc = 5;

void draw(){
	int abso = 0;
	background(255);
	if(vx > 0){
		arc(x,0,d,d,radians(0 + darc),radians(360 - darc));
	}else{
		arc(x,0,d,d,radians(0),radians(150 + darc));
		arc(x,0,d,d,radians(210 - darc),radians(360));
	}	
	if(darc >= 30 || darc <= 0){
		ddarc *= -1;
	}
	darc += ddarc;
	x += vx;
	if(x < 0){// left wall
		vx *= -1;
		abso = x * -1;
		x = abso;
	}else if(x > width-d){// right wall
		vx *= -1;
		abso = 2 * (width - d) - x;
		x = abso;
 	}
}
