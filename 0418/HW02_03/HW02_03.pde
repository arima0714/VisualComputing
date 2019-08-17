size(300, 300);
background(255);
colorMode(HSB, 100);

//drow color lines
int r = 120;
int diff = 90;
for(int i = 0; i < 100; i++){
  float theta = i * (TWO_PI) / 100;
  stroke(i, 100, 100);
  line((r-diff)*cos(theta) +150, (r-diff)*sin(theta) + 150, r*cos(theta) + 150, r*sin(theta) + 150);
}
