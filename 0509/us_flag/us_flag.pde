void fivestar (int x, int y, int r) {
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
  for(int i = 1; i <= 9; i++){
  int row = 0;
  int col = 0;
  int row_d = 0;
  int col_d = 0;
  row_d = int(blue_y / 10);
  row = row_d * i;
    if(i%2 == 1){
      //drow 6 stars
      col_d = (int)blue_x / 7;
      for(int j = 1; j <= 6; j++){
	col = col_d * j;
	fill(255);
	fivestar(col, row, 5);
      }

    }
    else{
      //drow 5 stars
      col_d = (int)blue_x / 7;
      int col_d_sub = col_d / 2;
      for(int j = 1; j <= 5; j++){
	col = col_d * j + col_d_sub;
	fill(255);
	fivestar(col, row, 5);
      }

    }
  }
}
