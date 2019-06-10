
int r = 5;
float xFunc(float t){
  return r * sin(t * 5);
  }
float yFunc(float t){
  return -1 * r * cos(t * 6);
  }
float xInWindow(float x, int unit){
  return(x * unit + width / 2);
}
float yInWindow(float y, int unit){
  return(-y * unit + height / 2);
}

// circle/drawParamGraph.pde
void drawParamFuncs(int unit){
  float theta = .0, step = .001;
  float x1, y1, x2, y2;
  x2 = xInWindow(xFunc(theta), unit);
  y2 = yInWindow(yFunc(theta), unit);
  while(theta < TWO_PI){
    x1 = x2;
    y1 = y2;
    x2 = xInWindow(xFunc(theta += step),unit);
    y2 = yInWindow(yFunc(theta), unit);
    line(x1, y1, x2, y2);
  }
}

void setup(){
  background(255, 255, 255);
  size(400, 400);
  drawParamFuncs(30);
}
