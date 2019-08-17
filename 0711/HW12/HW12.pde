// 提出遅れてしまい申し訳ございません
// よろしくお願いします

float rad = 0;
float diffColor = 0.5;
float diff = 0.1;

void setup(){
    size(400,400,P3D);
    noStroke();
}

void drawFloor(){
    fill(128);
    int s = 5;
    for(int z = -100; z < 100; z += s){
        for (int x = -100; x < 100; x += s){
            beginShape(QUADS);
                vertex(x, 0, z); vertex(x, 0, z + s);
                vertex(x + s, 0, z + s); vertex(x + s, 0, z);
            endShape();
        }
    }
}

void draw(){
    background(192);
    lights();
    translate(200, 200, -50);
    rotateX(radians(150));
    rotateY(radians(-20));
    spotLight(255,0,0, 40*cos(rad + diffColor), 50*sin(rad + diffColor), -50, -1, -1, 1, PI / 2, 100);
    spotLight(0,255,0, 40*cos(rad - diffColor), 50*sin(rad - diffColor), -50, -1, -1, 1, PI / 2, 100);
    spotLight(0,0,255, 40*cos(rad), 50*sin(rad), -50, -1, -1, 1, PI / 2, 100);
    drawFloor();
    rad += diff;
}
