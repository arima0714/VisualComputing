void setup(){
  size(1000, 1000, P3D);
  noStroke();
}

void draw(){
  background(255);
  translate(500, 500, 0);
  rotateX(-mouseY / 100.0);
  rotateY(-mouseX / 100.0);
  createRobot();
}

void createRobot(){
  fill(200);
  
  //パーツの左右はロボットからの視点
  //3Dのboxメソッドは、中心の座標を入力する

  //右足
  pushMatrix();
  translate(20, -20, 0);
  box(20, 40, 20);
  popMatrix();
  
  //左足
  pushMatrix();
  translate(-20, -20, 0);
  box(20, 40, 20);
  popMatrix();
  
  //左腿
  pushMatrix();
  translate(20, -70, 0);
  box(20, 40, 20);
  popMatrix();

  //右腿
  pushMatrix();
  translate(-20, -70, 0);
  box(20, 40, 20);
  popMatrix();
  
  //胴
  pushMatrix();
  translate(0, -175, 0);
  box(80, 150, 40);
  popMatrix();
  
  //左上腕
  pushMatrix();
  translate(70, -240, 0);
  box(40, 20, 20);
  popMatrix();
  
  //右上腕
  pushMatrix();
  translate(-70, -240, 0);
  box(40, 20, 20);
  popMatrix();
  
  //左前腕
  pushMatrix();
  translate(120, -240, 0);
  box(40, 20, 20);
  popMatrix();
  
  //右前腕
  pushMatrix();
  translate(-120, -240, 0);
  box(40, 20, 20);
  popMatrix();

  //頭
  pushMatrix();
  translate(0, -280, 0);
  box(40, 40, 20);
  popMatrix();
}
