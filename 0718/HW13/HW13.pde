PImage img00; //car texture

void texturedCube(PImage texture){
    pushMatrix();
        translate(-.5, -.5, -.5);
        beginShape(QUADS);
            texture(texture);
            textureMode(NORMAL);
            vertex(0,1,0,0,0); vertex(0,0,0,0,1);
                vertex(1,0,0,1,1); vertex(1,1,0,1,0);
            vertex(1,1,0,0,0); vertex(1,0,0,0,1);
                vertex(1,0,1,1,1); vertex(1,1,1,1,0);
            vertex(1,1,1,0,0); vertex(1,0,1,0,1);
                vertex(0,0,1,1,1); vertex(0,1,1,1,0);
            vertex(0,1,1,0,0); vertex(0,0,1,0,1);
                vertex(0,0,0,1,1); vertex(0,1,0,1,0);
            vertex(0,1,1,0,0); vertex(0,1,0,0,1);
                vertex(1,1,0,1,1); vertex(1,1,1,1,0);
            vertex(0,0,0,0,0); vertex(0,0,1,0,1);
                vertex(1,0,1,1,1); vertex(1,0,0,1,0);
        endShape();
    popMatrix();    
}

void setup(){
    size(800,800,P3D);
    noStroke();
    img00 = loadImage("texCar.jpg");
}

void mousePressed(){
    exit();
}

void leaf(int r, int g, int b){
    fill(r,g,b);
    beginShape(TRIANGLES);

        vertex(0,.5,0);
        vertex(-.5, 0, -.5);
        vertex(.5,0,-.5);
        
        vertex(0,.5,0);
        vertex(.5,0,-.5);
        vertex(.5,0,.5);

        vertex(0,.5,0);
        vertex(.5,0,.5);
        vertex(.5,0,.5);

        vertex(0,.5,0);
        vertex(-.5,0,.5);
        vertex(-.5,0,-.5);

        vertex(-.5,0,-.5);
        vertex(.5,0,.5);
        vertex(.5,0,-.5);

        vertex(-.5, 0, -.5);
        vertex(-.5,0,.5);
        vertex(.5,0,.5);
    endShape();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}

void drawCar(float sz){
    pushMatrix();
        scale(sz,sz,sz);
        //タイヤの描画
        pushMatrix();
            rotateX(PI/2.0);
            fill(0,0,0);
            pushMatrix();
                translate(.3,0);
                drawCylinder(.1,.1,.6,20);
            popMatrix();
            pushMatrix();
                translate(-.3,0);
                drawCylinder(.1,.1,.6,20);
            popMatrix();
        popMatrix();
        pushMatrix();
            translate(0,.3,0.2);
            scale(.9,.4,.8);
            texturedCube(img00);
        popMatrix();
    popMatrix();
}

float carX01 = 20;
float carY01 = 0;
float carX02 = 400;
float carY02 = 500;
float cameraX = 0;
float cameraY = 50;
float cameraZ = 0;


void draw(){

    background(255);
    lights();
    camera(800,800,800,cameraX,cameraY,cameraZ,0,-1,0);
    pushMatrix();
        translate(carX01,carY01);
        drawCar(100);
    popMatrix();
    pushMatrix();
        translate(carX02,carY02);
        drawCar(100);
    popMatrix();

    carX02 -= .7;
    carX01 += .7;
    cameraY += .8;
    cameraZ += .5;
}
