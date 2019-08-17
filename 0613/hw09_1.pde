void setup(){
  size(1000, 1000, P3D);
  noStroke();
}

void draw(){
  background(255);
  translate(450, 450, -200);  //そのままだと原点中心になるので、ウインドウの中心に描画されるように調整
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, PI, -PI));
  createCube();
}

void createCube(){  //xyz方向に少しずつ座標とRGB値を変化させながら立方体を描画
  for(int i = 1; i <= 11; i++){
    for(int j = 1; j <= 11; j++){
      for(int k = 1; k <= 11; k++){
        pushMatrix();
          translate(30*i, 30*j, 30*k);
          fill(255-20*i, 255-20*j, 255-20*k);
          box(15);
        popMatrix();
      }
    }
  }
}
