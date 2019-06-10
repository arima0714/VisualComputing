void setup(){
	size(700, 700);
	background(255);
	smooth();
}

int x1 = 0,	y1 = 0;
int x2 = 0,	y2 = 0;
int x3 = 0,	y3 = 0;
int x4 = 0,	y4 = 0;
int i = 0;

void draw(){
	if(i == 3){
		bezier(x1, y1, x2, y2, x3, y3, x4, y4);
	}
}

void mouseClicked(){
	if(i == 0){
		x1 = mouseX;
		y1 = mouseY;
	}else if(i == 1){
		x2 = mouseX;
		y2 = mouseY;
	}else if(i == 2){
		x3 = mouseX;
		y3 = mouseY;
	}else if(i == 3){
		x4 = mouseX;
		y4 = mouseY;
	}
	else{
		background(255);
		i = 0;
	}
	i = i + 1;
}

