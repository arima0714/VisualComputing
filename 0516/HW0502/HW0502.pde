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

  size(380 , 200);
  background(255, 255, 255);
  //drow red line wid = 200, hei = 30
  for(int i = 0; i < 13;i++){
    if(i % 2 == 0){
    fill(255,0,0);
    rect(0, 15.5 * i, 380, 15.5);
    }
  }
  //drow blue square top of left
  float blue_x = 380 / 7 * 3;
  float blue_y = 15.5 * 7;
  stroke(0,0,255);
  fill(0,0,255);
  rect(0, 0, blue_x , blue_y);
  noStroke();
  //drow stars
  for(int j = 1; j <= 9; j++){
 	float scale_x = 12;
 	float scale_y = 12;
 	int row = 0;
 	int col = 0;
 	int row_d = 0;
 	int col_d = 0;
 	row_d = int(blue_y/10);
 	row = row_d * j;
	if(j % 2 == 1){//6個
		col_d = (int)blue_x / 7;
		for(int i = 1; i <= 6; i++){
 			pushMatrix();
			fill(255,255,255);
			translate(col_d * i,blue_y / 10 * j);
			scale(scale_x,scale_y);
 			star();
 			popMatrix();
		}
	}
	if(j % 2 == 0){//5個
		col_d = (int)blue_x / 7;
		int col_d_sub = col_d / 2;
		for(int i = 1; i <= 5; i++){
 			pushMatrix();
			fill(255,255,255);
			translate(col_d * i + col_d_sub,blue_y / 10 * j);
			scale(scale_x,scale_y);
 			star();
 			popMatrix();
		}
	}
  }
}
