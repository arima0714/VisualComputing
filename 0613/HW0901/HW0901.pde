// 3Dに立方体を11*11*11個描画し、x,y,zにそれぞれRGBが変化するプログラム

// RGBのそれぞれの値は0~255なので255の0%,10%,20%,30%,40%,50%,60%,70%,80%,90%,100%を値に入れる

void setup(){
    size(900,900,P3D);
}

void draw(){
    background(256);
    translate(30,30);
    rotateX(map(mouseY,0,1500,PI,-PI));
    rotateY(map(mouseX,0,1500,PI,-PI));
    for(int i = 0; i < 11; i++){
        for(int j = 0; j < 11; j++){
            for(int k = 0; k < 11; k++){
                pushMatrix();
                    translate(800 * i * 0.1,800 * j * 0.1,800 * k * 0.1);
                    fill(256 * i * 0.1,256 * j * 0.1,256 * k * 0.1);
                    box(15,15,15);
                popMatrix();
            }
        }
    }
}